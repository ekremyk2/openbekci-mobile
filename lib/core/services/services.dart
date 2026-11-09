import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:local_auth/local_auth.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

/// Hands a file to the platform share sheet (statement PDFs, documents,
/// visitor QR codes in phase C). A seam so tests do not need the plugin.
abstract interface class ShareService {
  Future<void> shareFile({
    required Uint8List bytes,
    required String filename,
    required String mime,
  });
}

class PlatformShareService implements ShareService {
  const new();

  @override
  Future<void> shareFile({
    required Uint8List bytes,
    required String filename,
    required String mime,
  }) async {
    final dir = await getTemporaryDirectory();
    final file = File(p.join(dir.path, _safeName(filename)));
    await file.writeAsBytes(bytes, flush: true);
    await SharePlus.instance.share(
      ShareParams(files: [XFile(file.path, mimeType: mime)]),
    );
  }
}

/// A file name without path separators or control characters.
String _safeName(String name) {
  final clean = name.replaceAll(RegExp(r'[\/:*?"<>|\x00-\x1f]'), '_').trim();
  return clean.isEmpty ? 'file' : clean;
}

final shareServiceProvider = Provider<ShareService>(
  (ref) => const PlatformShareService(),
);

/// A photo chosen by the user, before compression.
@immutable
class PickedPhoto {
  const new({required this.name, required this.bytes});
  final String name;
  final Uint8List bytes;
}

/// Camera and gallery access. Permissions are requested by the platform in
/// context, when the user taps the button.
abstract interface class PhotoPicker {
  Future<List<PickedPhoto>> pickFromGallery({required int limit});
  Future<PickedPhoto?> takePhoto();
}

class PlatformPhotoPicker implements PhotoPicker {
  const new();

  @override
  Future<List<PickedPhoto>> pickFromGallery({required int limit}) async {
    final files = await ImagePicker().pickMultiImage(limit: limit);
    return [
      for (final f in files)
        PickedPhoto(name: f.name, bytes: await f.readAsBytes()),
    ];
  }

  @override
  Future<PickedPhoto?> takePhoto() async {
    final f = await ImagePicker().pickImage(source: ImageSource.camera);
    if (f == null) return null;
    return PickedPhoto(name: f.name, bytes: await f.readAsBytes());
  }
}

final photoPickerProvider = Provider<PhotoPicker>(
  (ref) => const PlatformPhotoPicker(),
);

/// Longest edge of an uploaded photo, in pixels.
const photoMaxEdge = 1600;

/// Compresses [bytes] for upload (mobile plan section 7.1): decode, scale the
/// longest edge down to [photoMaxEdge], re-encode as JPEG. Re-encoding drops
/// EXIF (including the location); the server strips it again. Returns the
/// input unchanged when it is not a decodable image.
Uint8List compressPhotoSync(Uint8List bytes, {int maxEdge = photoMaxEdge}) {
  final decoded = img.decodeImage(bytes);
  if (decoded == null) return bytes;
  var image = decoded;
  final longest = image.width > image.height ? image.width : image.height;
  if (longest > maxEdge) {
    image = image.width >= image.height
        ? img.copyResize(image, width: maxEdge)
        : img.copyResize(image, height: maxEdge);
  }
  return Uint8List.fromList(img.encodeJpg(image, quality: 82));
}

/// [compressPhotoSync] off the UI thread.
Future<Uint8List> compressPhoto(Uint8List bytes) =>
    compute(compressPhotoSync, bytes);

/// Result of an app-lock prompt.
enum LockResult { success, failed, unavailable }

/// Biometric or device-credential (PIN, pattern) prompt for the app lock.
abstract interface class LockAuthenticator {
  Future<bool> isAvailable();
  Future<LockResult> authenticate(String reason);
}

class PlatformLockAuthenticator implements LockAuthenticator {
  const new();

  @override
  Future<bool> isAvailable() async {
    try {
      final auth = LocalAuthentication();
      return await auth.isDeviceSupported();
    } on Object {
      return false;
    }
  }

  @override
  Future<LockResult> authenticate(String reason) async {
    try {
      final ok = await LocalAuthentication().authenticate(
        localizedReason: reason,
      );
      return ok ? LockResult.success : LockResult.failed;
    } on Object {
      return LockResult.unavailable;
    }
  }
}

final lockAuthenticatorProvider = Provider<LockAuthenticator>(
  (ref) => const PlatformLockAuthenticator(),
);
