import 'package:flutter/foundation.dart';

class PlatformHelper {
  static bool get isWeb => kIsWeb;

  static bool get isWebDesktop =>
      kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.windows ||
          defaultTargetPlatform == TargetPlatform.macOS ||
          defaultTargetPlatform == TargetPlatform.linux);

  static bool get isWebMobile =>
      kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS);
}