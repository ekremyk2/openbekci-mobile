import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openbekci_mobile/core/files/files.dart';
import 'package:openbekci_mobile/core/l10n/codes.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

/// Small coloured label ("Owner", "Declared", "Closed").
class Pill extends StatelessWidget {
  const new(this.label, {this.tone = PillTone.neutral, super.key});

  final String label;
  final PillTone tone;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final (bg, fg) = switch (tone) {
      PillTone.neutral => (
        scheme.surfaceContainerHighest,
        scheme.onSurfaceVariant,
      ),
      PillTone.good => (scheme.primaryContainer, scheme.onPrimaryContainer),
      PillTone.warn => (scheme.tertiaryContainer, scheme.onTertiaryContainer),
      PillTone.bad => (scheme.errorContainer, scheme.onErrorContainer),
    };
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 8,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(color: fg),
      ),
    );
  }
}

enum PillTone { neutral, good, warn, bad }

/// Section heading inside a list.
class SectionTitle extends StatelessWidget {
  const new(this.text, {this.trailing, super.key});

  final String text;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 20, bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: Semantics(
              header: true,
              child: Text(text, style: Theme.of(context).textTheme.titleMedium),
            ),
          ),
          ?trailing,
        ],
      ),
    );
  }
}

/// A label and a value on one row; the value can be copied.
class CopyRow extends StatelessWidget {
  const new({
    required this.label,
    required this.value,
    this.copyKey,
    super.key,
  });

  final String label;
  final String value;
  final Key? copyKey;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: theme.textTheme.bodySmall),
                SelectableText(value, style: theme.textTheme.bodyLarge),
              ],
            ),
          ),
          IconButton(
            key: copyKey,
            tooltip: l.actionCopyValue(label),
            icon: const Icon(Icons.copy_outlined),
            onPressed: () async {
              final messenger = ScaffoldMessenger.of(context);
              await Clipboard.setData(ClipboardData(text: value));
              messenger
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text(l.copiedToClipboard)));
            },
          ),
        ],
      ),
    );
  }
}

/// An image attachment, fetched through the authenticated client.
class RemoteImage extends ConsumerWidget {
  const new({
    required this.fileId,
    this.variant = 'thumb',
    this.size = 88,
    this.onTap,
    super.key,
  });

  final String fileId;
  final String? variant;
  final double size;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final bytes = ref.watch(
      fileBytesProvider((fileId: fileId, variant: variant)),
    );
    final scheme = Theme.of(context).colorScheme;
    return Semantics(
      label: l.attachmentPhoto,
      button: onTap != null,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            width: size,
            height: size,
            child: bytes.when(
              data: (b) => Image.memory(
                b,
                fit: BoxFit.cover,
                gaplessPlayback: true,
                errorBuilder: (_, _, _) => _placeholder(scheme),
              ),
              loading: () => ColoredBox(color: scheme.surfaceContainerHighest),
              error: (_, _) => _placeholder(scheme),
            ),
          ),
        ),
      ),
    );
  }

  Widget _placeholder(ColorScheme scheme) => ColoredBox(
    color: scheme.surfaceContainerHighest,
    child: Icon(Icons.broken_image_outlined, color: scheme.outline),
  );
}

/// Label of a count shown on cards ("3").
class CountBadge extends StatelessWidget {
  const new(this.count, {super.key});

  final int count;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 8,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: count > 0 ? scheme.primary : scheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '$count',
        style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: count > 0 ? scheme.onPrimary : scheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

/// A rendered enum label (see `codes.dart`).
String sideText(AppLocalizations l, String kind) => sideLabel(l, kind);
