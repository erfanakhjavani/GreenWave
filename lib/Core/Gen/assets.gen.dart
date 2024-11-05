/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsJpgGen {
  const $AssetsJpgGen();

  /// File path: assets/jpg/intro1.jpg
  AssetGenImage get intro1 => const AssetGenImage('assets/jpg/intro1.jpg');

  /// File path: assets/jpg/intro2.jpg
  AssetGenImage get intro2 => const AssetGenImage('assets/jpg/intro2.jpg');

  /// File path: assets/jpg/intro3.jpg
  AssetGenImage get intro3 => const AssetGenImage('assets/jpg/intro3.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [intro1, intro2, intro3];
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/anima_tik.json
  String get animaTik => 'assets/json/anima_tik.json';

  /// File path: assets/json/env1.json
  String get env1 => 'assets/json/env1.json';

  /// File path: assets/json/wave2.json
  String get wave2 => 'assets/json/wave2.json';

  /// File path: assets/json/waveloop.json
  String get waveloop => 'assets/json/waveloop.json';

  /// List of all assets
  List<String> get values => [animaTik, env1, wave2, waveloop];
}

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/google.png
  AssetGenImage get google => const AssetGenImage('assets/png/google.png');

  /// File path: assets/png/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/png/logo.png');

  /// File path: assets/png/logowb.png
  AssetGenImage get logowb => const AssetGenImage('assets/png/logowb.png');

  /// File path: assets/png/logowt.png
  AssetGenImage get logowt => const AssetGenImage('assets/png/logowt.png');

  /// List of all assets
  List<AssetGenImage> get values => [google, logo, logowb, logowt];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/logowt.svg
  String get logowt => 'assets/svg/logowt.svg';

  /// List of all assets
  List<String> get values => [logowt];
}

class Assets {
  Assets._();

  static const $AssetsJpgGen jpg = $AssetsJpgGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
