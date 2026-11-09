import 'dart:math';

import 'package:openbekci_mobile/core/api/interceptors.dart';

/// Keeps one `Idempotency-Key` per distinct request, so that a retry of the
/// *same* request after a timeout reuses its key (the server answers the first
/// attempt instead of doing it twice) while a changed request gets a new one
/// (mobile plan section 8). Held in memory for the app session: bookings,
/// visitor entries and decisions are short-lived forms.
class IdempotencyKeys {
  new([Random? random]) : _random = random ?? Random.secure();

  final Random _random;
  final Map<String, String> _keys = {};

  /// The key of the request described by [fingerprint]; the same fingerprint
  /// always gives the same key until [done] is called for it.
  String keyFor(String fingerprint) =>
      _keys.putIfAbsent(fingerprint, () => HeadersInterceptor.newId(_random));

  /// The request succeeded (or was abandoned): forget its key.
  void done(String fingerprint) => _keys.remove(fingerprint);

  int get pending => _keys.length;
}
