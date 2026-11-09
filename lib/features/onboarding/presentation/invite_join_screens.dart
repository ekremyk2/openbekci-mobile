import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openbekci_api/openbekci_api.dart';
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/auth/link_handler.dart';
import 'package:openbekci_mobile/core/links/app_link.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/core/widgets/form_support.dart';
import 'package:openbekci_mobile/core/widgets/states.dart';
import 'package:openbekci_mobile/features/onboarding/application/onboarding_providers.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

/// Opens an invitation (`/invite/{token}`): shows what it is for and accepts
/// it, creating the account (password) or linking the existing one.
class InviteScreen extends ConsumerStatefulWidget {
  const new({required this.token, super.key});

  final String token;

  @override
  ConsumerState<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends ConsumerState<InviteScreen>
    with SubmitState<InviteScreen> {
  InvitationPreview? _preview;
  AppError? _loadError;
  final _name = TextEditingController();
  final _password = TextEditingController();

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  @override
  void dispose() {
    _name.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      final p = await ref
          .read(authRepositoryProvider)
          .previewInvitation(widget.token);
      if (mounted) setState(() => _preview = p);
    } on Object catch (e) {
      if (mounted) setState(() => _loadError = AppError.from(e));
    }
  }

  Future<void> _accept() => submit(() async {
    final preview = _preview!;
    final result = await ref
        .read(authRepositoryProvider)
        .acceptInvitation(
          widget.token,
          password: preview.existingAccount ? null : _password.text,
          displayName: preview.existingAccount || _name.text.trim().isEmpty
              ? null
              : _name.text.trim(),
          locale: Localizations.localeOf(context).languageCode,
        );
    final server = ref.read(pendingServerProvider)!;
    await ref.read(sessionProvider).completeSignIn(server, result);
    if (mounted) context.go(ref.read(linkHandlerProvider).afterSignIn());
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final preview = _preview;
    if (_loadError != null) {
      return FormPage(
        title: l.inviteTitle,
        leading: BackButton(onPressed: () => context.go('/server')),
        children: [
          Text(
            _loadError!.status == 404 ? l.inviteInvalid : l.errorGeneric,
            key: const Key('inviteInvalid'),
          ),
          const SizedBox(height: 16),
          ErrorBanner(error: _loadError!),
        ],
      );
    }
    if (preview == null) {
      return FormPage(
        title: l.inviteTitle,
        children: const [Center(child: CircularProgressIndicator())],
      );
    }
    return FormPage(
      title: l.inviteTitle,
      leading: BackButton(onPressed: () => context.go('/server')),
      children: [
        Text(
          l.inviteBody(preview.orgName, preview.siteName),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        if (preview.unitDoorNumber != null)
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 4),
            child: Text(l.inviteUnit(preview.unitDoorNumber!)),
          ),
        const SizedBox(height: 16),
        if (preview.existingAccount)
          Text(l.inviteExistingAccount)
        else ...[
          Text(l.inviteNewAccount),
          const SizedBox(height: 16),
          TextField(
            key: const Key('inviteName'),
            controller: _name,
            textCapitalization: TextCapitalization.words,
            autofillHints: const [AutofillHints.name],
            decoration: InputDecoration(labelText: l.inviteDisplayName),
          ),
          const SizedBox(height: 16),
          TextField(
            key: const Key('invitePassword'),
            controller: _password,
            obscureText: true,
            autofillHints: const [AutofillHints.newPassword],
            decoration: InputDecoration(
              labelText: l.invitePassword,
              errorText: fieldMessage(context, error, 'password'),
            ),
          ),
        ],
        const SizedBox(height: 16),
        if (error != null) ...[
          ErrorBanner(error: error!),
          const SizedBox(height: 16),
        ],
        FilledButton(
          key: const Key('inviteAccept'),
          onPressed: busy ? null : _accept,
          child: Text(l.inviteAccept),
        ),
      ],
    );
  }
}

/// The site QR (`/join/{code}`): site info, then (signed in) the unit picker
/// and the claim request.
class JoinScreen extends ConsumerStatefulWidget {
  const new({required this.code, super.key});

  final String code;

  @override
  ConsumerState<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends ConsumerState<JoinScreen>
    with SubmitState<JoinScreen> {
  JoinInfo? _info;
  AppError? _loadError;
  List<JoinUnit> _units = const [];
  String? _blockId;
  JoinUnit? _selected;
  UnitClaimCreateClaimedRoleEnum _role = UnitClaimCreateClaimedRoleEnum.owner;
  final _search = TextEditingController();
  final _note = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    unawaited(_load());
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _search.dispose();
    _note.dispose();
    super.dispose();
  }

  bool get _signedIn => ref.read(accountProvider).value != null;

  Future<void> _load() async {
    try {
      // The account loads from secure storage; the picker needs to know it.
      await ref.read(accountProvider.future);
      final repo = ref.read(joinRepositoryProvider);
      final info = await repo.info(widget.code);
      if (!mounted) return;
      setState(() => _info = info);
      if (_signedIn) await _loadUnits();
    } on Object catch (e) {
      if (mounted) setState(() => _loadError = AppError.from(e));
    }
  }

  Future<void> _loadUnits() async {
    try {
      final list = await ref
          .read(joinRepositoryProvider)
          .units(widget.code, blockId: _blockId, query: _search.text.trim());
      if (mounted) setState(() => _units = list.items);
    } on Object catch (e) {
      if (mounted) setState(() => error = AppError.from(e));
    }
  }

  void _onSearchChanged(String _) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), _loadUnits);
  }

  Future<void> _claim() => submit(() async {
    final unit = _selected!;
    final claim = await ref
        .read(joinRepositoryProvider)
        .claim(
          widget.code,
          unitId: unit.id,
          role: _role,
          note: _note.text.trim(),
        );
    ref.read(lastClaimProvider.notifier).set(claim);
    if (mounted) context.go('/claim');
  });

  void _signInFirst({bool signUp = false}) {
    ref.read(pendingLinkProvider.notifier).set(JoinLink(code: widget.code));
    context.go(
      signUp
          ? '/sign-in/sms?join=${Uri.encodeComponent(widget.code)}'
          : '/sign-in',
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final info = _info;
    if (_loadError != null) {
      return Scaffold(
        appBar: AppBar(title: Text(l.signInTitle)),
        body: ErrorState(
          error: _loadError!,
          onRetry: () {
            setState(() => _loadError = null);
            unawaited(_load());
          },
        ),
      );
    }
    if (info == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    final signedIn = _signedIn;
    return FormPage(
      title: l.joinTitle(info.siteName),
      leading: BackButton(
        onPressed: () => context.go(signedIn ? '/' : '/server'),
      ),
      children: [
        Text(
          l.joinOrg(info.orgName),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        if (!signedIn) ...[
          Text(l.joinSignInFirst),
          const SizedBox(height: 16),
          FilledButton(
            key: const Key('joinSignIn'),
            onPressed: _signInFirst,
            child: Text(l.signInTitle),
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            key: const Key('joinSignUp'),
            onPressed: () => _signInFirst(signUp: true),
            child: Text(l.joinSignUp),
          ),
        ] else
          ..._picker(context, l, info),
      ],
    );
  }

  List<Widget> _picker(
    BuildContext context,
    AppLocalizations l,
    JoinInfo info,
  ) {
    return [
      DropdownButtonFormField<String?>(
        key: const Key('joinBlock'),
        initialValue: _blockId,
        decoration: InputDecoration(labelText: l.joinBlock),
        items: [
          DropdownMenuItem<String?>(child: Text(l.joinAllBlocks)),
          for (final b in info.blocks)
            DropdownMenuItem<String?>(value: b.id, child: Text(b.name)),
        ],
        onChanged: (v) {
          setState(() {
            _blockId = v;
            _selected = null;
          });
          unawaited(_loadUnits());
        },
      ),
      const SizedBox(height: 12),
      TextField(
        key: const Key('joinSearch'),
        controller: _search,
        onChanged: _onSearchChanged,
        decoration: InputDecoration(
          labelText: l.joinSearchUnit,
          prefixIcon: const Icon(Icons.search),
        ),
      ),
      const SizedBox(height: 8),
      if (_units.isEmpty)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(l.joinNoUnits),
        )
      else
        RadioGroup<String>(
          groupValue: _selected?.id,
          onChanged: (id) =>
              setState(() => _selected = _units.firstWhere((u) => u.id == id)),
          child: Column(
            children: [
              for (final u in _units)
                RadioListTile<String>(
                  key: Key('unit_${u.id}'),
                  value: u.id,
                  title: Text(l.joinUnitLine(u.blockName, u.doorNumber)),
                ),
            ],
          ),
        ),
      const SizedBox(height: 16),
      Text(l.joinRoleTitle, style: Theme.of(context).textTheme.titleSmall),
      const SizedBox(height: 8),
      SegmentedButton<UnitClaimCreateClaimedRoleEnum>(
        key: const Key('joinRole'),
        showSelectedIcon: false,
        segments: [
          ButtonSegment(
            value: UnitClaimCreateClaimedRoleEnum.owner,
            label: Text(l.joinRoleOwner),
          ),
          ButtonSegment(
            value: UnitClaimCreateClaimedRoleEnum.tenant,
            label: Text(l.joinRoleTenant),
          ),
          ButtonSegment(
            value: UnitClaimCreateClaimedRoleEnum.household,
            label: Text(l.joinRoleHousehold),
          ),
        ],
        selected: {_role},
        onSelectionChanged: (s) => setState(() => _role = s.first),
      ),
      const SizedBox(height: 16),
      TextField(
        key: const Key('joinNote'),
        controller: _note,
        maxLines: 2,
        decoration: InputDecoration(labelText: l.joinNote),
      ),
      const SizedBox(height: 16),
      if (error != null) ...[
        ErrorBanner(error: error!),
        const SizedBox(height: 16),
      ],
      FilledButton(
        key: const Key('joinSubmit'),
        onPressed: busy || _selected == null ? null : _claim,
        child: Text(l.joinSubmit),
      ),
    ];
  }
}

/// "Waiting for the manager's approval" after a unit claim (mobile plan
/// section 6, site QR sign-up with unit claim).
class ClaimStatusScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final claim = ref.watch(lastClaimProvider);
    final theme = Theme.of(context);
    final String title;
    final String body;
    final IconData icon;
    switch (claim?.status) {
      case UnitClaimStatusEnum.approved:
        title = l.claimApprovedTitle;
        body = '';
        icon = Icons.check_circle_outline;
      case UnitClaimStatusEnum.rejected:
        title = l.claimRejectedTitle;
        body = l.claimRejectedBody;
        icon = Icons.cancel_outlined;
      case UnitClaimStatusEnum.pending:
      case null:
        title = l.claimWaitingTitle;
        body = l.claimWaitingBody(claim?.unitDoorNumber ?? '');
        icon = Icons.hourglass_top;
      case UnitClaimStatusEnum.unknownDefaultOpenApi:
        title = l.claimWaitingTitle;
        body = l.claimUnknownStatus(claim!.status.value);
        icon = Icons.hourglass_top;
    }
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsetsDirectional.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 64, color: theme.colorScheme.primary),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: theme.textTheme.titleLarge,
                  key: const Key('claimTitle'),
                ),
                const SizedBox(height: 8),
                Text(body, textAlign: TextAlign.center),
                const SizedBox(height: 24),
                FilledButton(
                  key: const Key('claimHome'),
                  onPressed: () => context.go('/'),
                  child: Text(l.claimGoHome),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
