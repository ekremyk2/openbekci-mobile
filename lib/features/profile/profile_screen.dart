import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openbekci_api/openbekci_api.dart' hide Notification;
import 'package:openbekci_mobile/app/theme/theme.dart' show Look;
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/l10n/codes.dart';
import 'package:openbekci_mobile/core/org/org_context.dart';
import 'package:openbekci_mobile/core/providers.dart';
import 'package:openbekci_mobile/core/services/services.dart';
import 'package:openbekci_mobile/core/widgets/display.dart';
import 'package:openbekci_mobile/core/widgets/form_support.dart';
import 'package:openbekci_mobile/core/widgets/resident_widgets.dart';
import 'package:openbekci_mobile/core/widgets/states.dart';
import 'package:openbekci_mobile/features/home/home_screen.dart';
import 'package:openbekci_mobile/features/profile/application/profile_providers.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

/// Profile hub: who I am, my units and sides, organization, and the settings
/// pages (mobile plan 7.1 Profile).
class ProfileScreen extends ConsumerWidget {
  const new({super.key});

  Future<void> _confirmSignOut(BuildContext context, WidgetRef ref) async {
    final l = AppLocalizations.of(context);
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(l.profileSignOutConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l.actionCancel),
          ),
          FilledButton(
            key: const Key('confirmSignOut'),
            onPressed: () => Navigator.pop(context, true),
            child: Text(l.actionSignOut),
          ),
        ],
      ),
    );
    if (ok ?? false) {
      await ref.read(sessionProvider).signOut();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final account = ref.watch(accountProvider).value;
    final me = ref.watch(meProvider).value;
    final ctx = ref.watch(orgContextProvider);
    final data = me?.data;
    return Scaffold(
      appBar: AppBar(title: Text(l.profileTitle)),
      body: ListView(
        children: [
          if (me?.isOffline ?? false) const OfflineBanner(),
          if (data == null)
            const SkeletonList(rows: 3)
          else ...[
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: Text(l.profileName),
              subtitle: Text(data.user.displayName),
            ),
            if (data.user.phone != null)
              ListTile(
                leading: const Icon(Icons.phone_outlined),
                title: Text(l.profilePhone),
                subtitle: Text(data.user.phone!),
              ),
            if (data.user.email != null)
              ListTile(
                leading: const Icon(Icons.mail_outline),
                title: Text(l.profileEmail),
                subtitle: Text(data.user.email!),
              ),
          ],
          ListTile(
            leading: const Icon(Icons.dns_outlined),
            title: Text(l.profileServer),
            subtitle: Text(
              '${account?.instanceName ?? ''}\n${account?.serverOrigin ?? ''}',
            ),
            isThreeLine: true,
          ),
          if (data != null && data.organizations.isNotEmpty) ...[
            const Divider(),
            ListTile(title: Text(l.profileOrganizations)),
            RadioGroup<String>(
              groupValue: ctx?.orgId,
              onChanged: (id) {
                if (id != null) {
                  unawaited(ref.read(selectedOrgProvider.notifier).select(id));
                }
              },
              child: Column(
                children: [
                  for (final o in data.organizations)
                    RadioListTile<String>(
                      key: Key('org_${o.id}'),
                      value: o.id,
                      title: Text(o.name),
                    ),
                ],
              ),
            ),
          ],
          if (ctx != null && ctx.occupancies.isNotEmpty) ...[
            const Divider(),
            ListTile(title: Text(l.profileUnits)),
            for (final o in ctx.occupancies)
              ListTile(
                key: Key('occupancy_${o.id}'),
                leading: const Icon(Icons.home_outlined),
                title: Text(o.unitLabel),
                subtitle: Text(
                  [
                    occupancyLabel(l, o.kind),
                    if (o.side != null &&
                        o.side != MeOccupancySideEnum.unknownDefaultOpenApi)
                      sideLabel(l, o.side!.value),
                    if (o.kind == MeOccupancyKindEnum.household &&
                        o.maySeeMoney)
                      l.householdSeesMoney,
                    if (o.kind == MeOccupancyKindEnum.household &&
                        !o.maySeeMoney)
                      l.householdNoMoney,
                  ].join(' · '),
                ),
              ),
          ] else if (data != null && data.occupancies.isNotEmpty) ...[
            const Divider(),
            ListTile(title: Text(l.profileUnits)),
            for (final o in data.occupancies)
              ListTile(
                title: Text(o.unitLabel),
                subtitle: Text(occupancyLabel(l, o.kind)),
              ),
          ],
          const Divider(),
          ListTile(
            key: const Key('openMe'),
            leading: const Icon(Icons.edit_outlined),
            title: Text(l.profileEditMe),
            subtitle: Text(l.profileEditMeBody),
            onTap: () => context.push('/profile/me'),
          ),
          ListTile(
            key: const Key('openDirectory'),
            leading: const Icon(Icons.contacts_outlined),
            title: Text(l.directoryTitle),
            onTap: () => context.push('/profile/directory'),
          ),
          ListTile(
            key: const Key('openSessions'),
            leading: const Icon(Icons.devices_outlined),
            title: Text(l.sessionsTitle),
            onTap: () => context.push('/profile/sessions'),
          ),
          ListTile(
            key: const Key('openLock'),
            leading: const Icon(Icons.lock_outline),
            title: Text(l.appLockTitle),
            onTap: () => context.push('/profile/lock'),
          ),
          ListTile(
            key: const Key('openConsents'),
            leading: const Icon(Icons.fact_check_outlined),
            title: Text(l.consentsTitle),
            onTap: () => context.push('/profile/consents'),
          ),
          ListTile(
            key: const Key('openAbout'),
            leading: const Icon(Icons.info_outline),
            title: Text(l.aboutTitle),
            onTap: () => context.push('/profile/about'),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsetsDirectional.all(16),
            child: OutlinedButton.icon(
              key: const Key('signOut'),
              icon: const Icon(Icons.logout),
              label: Text(l.actionSignOut),
              onPressed: () => _confirmSignOut(context, ref),
            ),
          ),
        ],
      ),
    );
  }
}

/// Edit my name, gate contact phone and language. The gate guard calls the
/// gate contact phone when an unknown visitor is not answered in the app (C2).
class EditMeScreen extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<EditMeScreen> createState() => _EditMeState();
}

class _EditMeState extends ConsumerState<EditMeScreen> with SubmitState {
  final _name = TextEditingController();
  final _gate = TextEditingController();
  bool _filled = false;
  bool _saved = false;

  @override
  void dispose() {
    _name.dispose();
    _gate.dispose();
    super.dispose();
  }

  Future<void> _save(Person person) async {
    await submit(() async {
      final name = _name.text.trim();
      final gate = _gate.text.trim();
      await updateMyPerson(
        ref,
        current: person,
        displayName: name.isEmpty || name == person.displayName ? null : name,
        gateContactPhone: gate.isEmpty ? null : gate,
        clearGatePhone: gate.isEmpty && person.gateContactPhone != null,
      );
      if (mounted) setState(() => _saved = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final async = ref.watch(myPersonProvider);
    final person = async.value?.data;
    if (person != null && !_filled) {
      _name.text = person.displayName;
      _gate.text = person.gateContactPhone ?? '';
      _filled = true;
    }
    final locale = ref.watch(localeProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l.profileEditMe)),
      body: person == null
          ? (async.value?.error != null
                ? ErrorState(
                    error: async.value!.error!,
                    onRetry: () => ref.invalidate(myPersonProvider),
                  )
                : const SkeletonList())
          : ListView(
              padding: const EdgeInsetsDirectional.all(16),
              children: [
                TextField(
                  key: const Key('meName'),
                  controller: _name,
                  decoration: InputDecoration(
                    labelText: l.profileName,
                    errorText: fieldMessage(context, error, 'display_name'),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                if (person.contact.phone != null)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(l.profilePhone),
                    subtitle: Text(person.contact.phone!),
                  ),
                if (person.contact.email != null)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(l.profileEmail),
                    subtitle: Text(person.contact.email!),
                  ),
                Text(l.profileContactsNote),
                const SizedBox(height: 16),
                TextField(
                  key: const Key('gatePhone'),
                  controller: _gate,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: l.gatePhoneLabel,
                    helperText: l.gatePhoneHelp,
                    helperMaxLines: 3,
                    errorText: fieldMessage(
                      context,
                      error,
                      'gate_contact_phone',
                    ),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                if (error != null && error!.fieldErrors.isEmpty) ...[
                  ErrorBanner(error: error!),
                  const SizedBox(height: 12),
                ],
                if (_saved)
                  Padding(
                    padding: const EdgeInsetsDirectional.only(bottom: 12),
                    child: Text(l.saved, key: const Key('savedNote')),
                  ),
                FilledButton(
                  key: const Key('meSave'),
                  onPressed: busy ? null : () => _save(person),
                  child: Text(l.actionSave),
                ),
                SectionTitle(l.languageTitle),
                RadioGroup<String>(
                  groupValue: locale?.languageCode ?? '',
                  onChanged: (v) => saveLocale(
                    ref,
                    v == null || v.isEmpty ? null : Locale(v),
                  ),
                  child: Column(
                    children: [
                      RadioListTile<String>(
                        key: const Key('lang_device'),
                        value: '',
                        title: Text(l.languageDevice),
                      ),
                      const RadioListTile<String>(
                        key: Key('lang_en'),
                        value: 'en',
                        title: Text('English'),
                      ),
                      const RadioListTile<String>(
                        key: Key('lang_tr'),
                        value: 'tr',
                        title: Text('Türkçe'),
                      ),
                    ],
                  ),
                ),
                SectionTitle(l.lookTitle),
                RadioGroup<Look>(
                  groupValue: ref.watch(lookProvider),
                  onChanged: (v) => saveLook(ref, v ?? Look.kiremit),
                  child: const Column(
                    children: [
                      RadioListTile<Look>(
                        key: Key('look_kiremit'),
                        value: Look.kiremit,
                        title: Text('Kiremit'),
                      ),
                      RadioListTile<Look>(
                        key: Key('look_tas'),
                        value: Look.tas,
                        title: Text('Taş'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

/// Directory opt-in per site (S8).
class DirectoryScreen extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<DirectoryScreen> createState() => _DirectoryState();
}

class _DirectoryState extends ConsumerState<DirectoryScreen> {
  AppError? _error;
  bool _busy = false;

  Future<void> _set(String siteId, bool consent, bool showPhone) async {
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await setDirectoryConsent(
        ref,
        siteId: siteId,
        consent: consent,
        showPhone: showPhone,
      );
    } on Object catch (e) {
      if (mounted) setState(() => _error = AppError.from(e));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final ctx = ref.watch(orgContextProvider);
    final async = ref.watch(myPersonProvider);
    final person = async.value?.data;
    return Scaffold(
      appBar: AppBar(title: Text(l.directoryTitle)),
      body: person == null || ctx == null
          ? const SkeletonList()
          : ListView(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.all(16),
                  child: Text(l.directoryBody),
                ),
                if (_error != null)
                  Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 16,
                    ),
                    child: ErrorBanner(error: _error!),
                  ),
                for (final site in ctx.org.sites) ...[
                  Builder(
                    builder: (context) {
                      final c = person.directoryConsent
                          .where((c) => c.siteId == site.id)
                          .firstOrNull;
                      final on = c?.consent ?? false;
                      return Column(
                        children: [
                          SwitchListTile(
                            key: Key('directory_${site.id}'),
                            title: Text(site.name),
                            subtitle: Text(l.directoryListMe),
                            value: on,
                            onChanged: _busy
                                ? null
                                : (v) =>
                                      _set(site.id, v, c?.showPhone ?? false),
                          ),
                          if (on)
                            SwitchListTile(
                              key: Key('directoryPhone_${site.id}'),
                              contentPadding: const EdgeInsetsDirectional.only(
                                start: 32,
                                end: 16,
                              ),
                              title: Text(l.directoryShowPhone),
                              value: c?.showPhone ?? false,
                              onChanged: _busy
                                  ? null
                                  : (v) => _set(site.id, true, v),
                            ),
                        ],
                      );
                    },
                  ),
                ],
              ],
            ),
    );
  }
}

/// Devices signed in to the account; revoke any other one.
class SessionsScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final ctx = ref.watch(orgContextProvider);
    final async = ref.watch(sessionsProvider);
    final list = async.value?.data;
    return Scaffold(
      appBar: AppBar(title: Text(l.sessionsTitle)),
      body: list == null
          ? (async.value?.error != null
                ? ErrorState(
                    error: async.value!.error!,
                    onRetry: () => ref.invalidate(sessionsProvider),
                  )
                : const SkeletonList())
          : RefreshIndicator(
              onRefresh: () async => ref.invalidate(sessionsProvider),
              child: ListView(
                children: [
                  for (final s in list)
                    ListTile(
                      key: Key('session_${s.id}'),
                      leading: Icon(
                        s.client == SessionClientEnum.mobile
                            ? Icons.smartphone
                            : Icons.computer,
                      ),
                      title: Text(
                        s.deviceName ?? sessionClientLabel(l, s.client),
                      ),
                      subtitle: Wrap(
                        spacing: 8,
                        children: [
                          if (s.lastUsedAt != null)
                            SiteDate(
                              instant: s.lastUsedAt,
                              timezone: ctx?.timezone ?? 'UTC',
                              withTime: true,
                            ),
                          if (s.ip != null) Text(s.ip!),
                        ],
                      ),
                      trailing: s.current
                          ? Pill(l.sessionThisDevice, tone: PillTone.good)
                          : TextButton(
                              key: Key('revoke_${s.id}'),
                              onPressed: () => _revoke(context, ref, s),
                              child: Text(l.sessionRevoke),
                            ),
                    ),
                ],
              ),
            ),
    );
  }

  Future<void> _revoke(BuildContext context, WidgetRef ref, Session s) async {
    final l = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final ok = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(l.sessionRevokeConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l.actionCancel),
          ),
          FilledButton(
            key: const Key('confirmRevoke'),
            onPressed: () => Navigator.pop(context, true),
            child: Text(l.sessionRevoke),
          ),
        ],
      ),
    );
    if (!(ok ?? false)) return;
    try {
      await revokeSession(ref, s.id);
    } on Object catch (e) {
      messenger.showSnackBar(
        SnackBar(content: Text(errorMessage(l, AppError.from(e)))),
      );
    }
  }
}

/// App lock: biometrics or the device PIN.
class AppLockScreen extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<AppLockScreen> createState() => _AppLockState();
}

class _AppLockState extends ConsumerState<AppLockScreen> {
  String? _message;

  Future<void> _toggle(bool enable) async {
    final l = AppLocalizations.of(context);
    final result = await ref
        .read(appLockProvider.notifier)
        .setEnabled(enable: enable, reason: l.lockReason);
    if (!mounted) return;
    setState(
      () => _message = switch (result) {
        LockResult.success => null,
        LockResult.failed => l.lockFailed,
        LockResult.unavailable => l.lockUnavailable,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final lock = ref.watch(appLockProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l.appLockTitle)),
      body: ListView(
        padding: const EdgeInsetsDirectional.all(16),
        children: [
          Text(l.appLockBody),
          const SizedBox(height: 12),
          SwitchListTile(
            key: const Key('lockSwitch'),
            title: Text(l.appLockEnable),
            value: lock.enabled,
            onChanged: _toggle,
          ),
          if (_message != null)
            Text(
              _message!,
              key: const Key('lockMessage'),
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
        ],
      ),
    );
  }
}

/// Consents. The served contract has one consent, the directory opt-in; the
/// other consent documents (texts from the server, accept or decline) are not
/// part of the contract yet.
class ConsentsScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final ctx = ref.watch(orgContextProvider);
    final person = ref.watch(myPersonProvider).value?.data;
    return Scaffold(
      appBar: AppBar(title: Text(l.consentsTitle)),
      body: ListView(
        padding: const EdgeInsetsDirectional.all(16),
        children: [
          Text(l.consentsBody),
          const SizedBox(height: 12),
          if (ctx != null && person != null)
            for (final site in ctx.org.sites)
              Card(
                key: Key('consent_${site.id}'),
                child: ListTile(
                  title: Text(l.consentDirectory(site.name)),
                  subtitle: Text(
                    (person.directoryConsent
                                .where((c) => c.siteId == site.id)
                                .firstOrNull
                                ?.consent ??
                            false)
                        ? l.consentAccepted
                        : l.consentDeclined,
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => context.push('/profile/directory'),
                ),
              ),
          const SizedBox(height: 12),
          Text(l.consentsOtherNote, key: const Key('consentsNote')),
        ],
      ),
    );
  }
}

/// Version, server and open-source licenses.
class AboutScreen extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final info = ref.watch(appInfoProvider);
    final config = ref.watch(appConfigProvider);
    return Scaffold(
      appBar: AppBar(title: Text(l.aboutTitle)),
      body: ListView(
        children: [
          ListTile(
            title: Text(config.appName),
            subtitle: Text(l.aboutVersion(info.version, info.build)),
          ),
          ListTile(
            key: const Key('openLicenses'),
            leading: const Icon(Icons.description_outlined),
            title: Text(l.aboutLicenses),
            onTap: () => showLicensePage(
              context: context,
              applicationName: config.appName,
              applicationVersion: info.version,
            ),
          ),
        ],
      ),
    );
  }
}
