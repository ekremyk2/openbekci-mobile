/// An id that is safe to put in a route path or URL: 1 to 64 characters of
/// `[A-Za-z0-9_-]` (no separators, dots, escapes, spaces or query). Apply it to
/// every id read from a link, a push or a notification payload.
final _safeIdPattern = RegExp(r'^[A-Za-z0-9_-]{1,64}$');

String? safeId(Object? v) =>
    v is String && _safeIdPattern.hasMatch(v) ? v : null;
