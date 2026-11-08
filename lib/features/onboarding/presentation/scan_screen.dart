import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:openbekci_mobile/core/api/app_error.dart';
import 'package:openbekci_mobile/core/auth/link_handler.dart';
import 'package:openbekci_mobile/core/links/app_link.dart';
import 'package:openbekci_mobile/l10n/gen/app_localizations.dart';

/// Builds the camera view; `onCode` receives each decoded QR payload. A seam so
/// tests do not need a camera.
typedef ScannerBuilder = Widget Function(
  BuildContext context,
  void Function(String code) onCode,
);

Widget _cameraScanner(BuildContext context, void Function(String) onCode) {
  final l = AppLocalizations.of(context);
  return MobileScanner(
    onDetect: (capture) {
      for (final barcode in capture.barcodes) {
        final raw = barcode.rawValue;
        if (raw != null) {
          onCode(raw);
          return;
        }
      }
    },
    errorBuilder: (context, error) => Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(l.scanPermissionDenied, textAlign: TextAlign.center),
      ),
    ),
  );
}

/// Scans the site QR (`{BASE_URL}/join/{code}`), an invitation QR or a server
/// QR and routes it like any incoming link.
class ScanScreen extends ConsumerStatefulWidget {
  const new({this.scannerBuilder = _cameraScanner, super.key});

  final ScannerBuilder scannerBuilder;

  @override
  ConsumerState<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends ConsumerState<ScanScreen> {
  bool _handling = false;

  Future<void> _onCode(String code) async {
    if (_handling) return;
    final l = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final link = AppLink.parse(code);
    if (link == null) {
      messenger.showSnackBar(SnackBar(content: Text(l.scanNotRecognized)));
      return;
    }
    _handling = true;
    try {
      final location = await ref.read(linkHandlerProvider).resolve(link);
      if (mounted) context.go(location);
    } on AppError {
      _handling = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l.scanTitle)),
      body: Stack(
        children: [
          Positioned.fill(child: widget.scannerBuilder(context, _onCode)),
          PositionedDirectional(
            start: 16,
            end: 16,
            bottom: 24,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(l.scanHint, textAlign: TextAlign.center),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
