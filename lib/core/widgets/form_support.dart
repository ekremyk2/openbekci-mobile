import 'package:flutter/material.dart';
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/l10n/codes.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

/// Busy flag and last error for a screen that submits to the API.
mixin SubmitState<T extends StatefulWidget> on State<T> {
  bool busy = false;
  AppError? error;

  /// Runs [action]; failures become [error] (shown with [ErrorBanner]).
  Future<void> submit(Future<void> Function() action) async {
    setState(() {
      busy = true;
      error = null;
    });
    try {
      await action();
    } on Object catch (e) {
      if (mounted) setState(() => error = AppError.from(e));
    } finally {
      if (mounted) setState(() => busy = false);
    }
  }
}

/// Inline error under a form: the translated message and the code under
/// "details".
class ErrorBanner extends StatelessWidget {
  const new({required this.error, super.key});

  final AppError error;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Semantics(
      liveRegion: true,
      child: Container(
        padding: const EdgeInsetsDirectional.all(12),
        decoration: BoxDecoration(
          color: theme.colorScheme.errorContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              errorMessage(l, error),
              style: TextStyle(color: theme.colorScheme.onErrorContainer),
            ),
            if (!isKnownErrorCode(l, error.code) || error.requestId != null)
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 4),
                child: SelectableText(
                  errorDetails(l, error),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onErrorContainer,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// The server's message for a field of a `validation_failed` problem.
String? fieldMessage(BuildContext context, AppError? error, String field) {
  final fe = error?.fieldError(field);
  if (fe == null) return null;
  return fieldErrorMessage(AppLocalizations.of(context), fe);
}

/// A page body that scrolls, is padded and capped in width.
class FormPage extends StatelessWidget {
  const new({
    required this.title,
    required this.children,
    this.leading,
    this.actions,
    super.key,
  });

  final String title;
  final List<Widget> children;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), leading: leading, actions: actions),
      body: SafeArea(
        child: Align(
          alignment: AlignmentDirectional.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: ListView(
              padding: const EdgeInsetsDirectional.all(20),
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
