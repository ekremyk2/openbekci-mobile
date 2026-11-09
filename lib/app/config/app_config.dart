import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// Build flavor. `dev` allows plain http to loopback hosts and shows debug aids.
enum Flavor {
  dev,
  prod;

  bool get isDev => this == Flavor.dev;
}

/// Static, per-build configuration read from `assets/app_config.json`
/// (mobile plan section 15). White-label rebranding edits this file.
@immutable
class AppConfig {
  const new({
    required this.flavor,
    required this.appName,
    required this.relayId,
    required this.seedColor,
    this.defaultServerUrl,
    this.supportUrl,
  });

  /// Parses the JSON document. [flavor] and the `OPENBEKCI_SERVER` compile-time
  /// define (`--dart-define=OPENBEKCI_SERVER=http://10.0.2.2:8484`) refine it.
  factory fromJson(
    Map<String, Object?> json, {
    required Flavor flavor,
    String? serverOverride,
  }) {
    final brand = (json['brand'] as Map<String, Object?>?) ?? const {};
    final override = (serverOverride ?? '').trim();
    final fromFile = json['default_server_url'] as String?;
    return AppConfig(
      flavor: flavor,
      appName: (json['app_name'] as String?) ?? 'OpenBekci',
      relayId: (json['relay_id'] as String?) ?? 'official',
      seedColor:
          parseHexColor(brand['seed_color'] as String?) ??
          const Color(0xFFB75131),
      defaultServerUrl: override.isNotEmpty
          ? override
          : (fromFile != null && fromFile.isNotEmpty ? fromFile : null),
      supportUrl: json['support_url'] as String?,
    );
  }

  final Flavor flavor;
  final String appName;
  final String relayId;
  final Color seedColor;

  /// Prefilled on the server screen; `null` when the build has none.
  final String? defaultServerUrl;
  final String? supportUrl;

  /// Loads the bundled config for [flavor].
  static Future<AppConfig> load(Flavor flavor, {AssetBundle? bundle}) async {
    final raw = await (bundle ?? rootBundle).loadString(
      'assets/app_config.json',
    );
    const serverOverride = String.fromEnvironment('OPENBEKCI_SERVER');
    return AppConfig.fromJson(
      json.decode(raw) as Map<String, Object?>,
      flavor: flavor,
      serverOverride: serverOverride,
    );
  }
}

/// Parses `#RRGGBB` or `#AARRGGBB`; returns null when it is not a color.
Color? parseHexColor(String? value) {
  if (value == null) return null;
  var hex = value.trim().replaceFirst('#', '');
  if (hex.length == 6) hex = 'FF$hex';
  if (hex.length != 8) return null;
  final parsed = int.tryParse(hex, radix: 16);
  return parsed == null ? null : Color(parsed);
}
