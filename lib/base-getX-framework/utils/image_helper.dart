import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:i_chaos/base-getX-framework/flutter3-pak-process/widget-chain/widget_chain.dart';
import 'package:i_chaos/ichaos/common-module/resources/app_style.dart';
import 'package:path_provider/path_provider.dart';

class ImageHelper {
  static final path = _ImgPath();
  static final imgWidget = _ImgWidget();

//  Widget placeHolder({required double width, double? height}) {
//    return SizedBox(width: width, height: height, child: CupertinoActivityIndicator(radius: min(10.0, width / 3)));
//  }

  /// 保存图片到临时路径
  static Future<String> saveImage(String name, Uint8List fileData) async {
    Directory tempDir = await getTemporaryDirectory();
    File file = File("${tempDir.path}/$name.png");
    file.writeAsBytesSync(fileData);
    return file.path;
  }
}

class _ImgPath {
  static const String _baseUrl = '';
  static const String _netImagePrefix = '$_baseUrl/';

  static const String _extPNGType = ".png";
  static const String _extSVGType = ".svg";

  get baseUrl => _baseUrl;

  get netImagePrefix => _netImagePrefix;

  get extPNGType => _extPNGType;

  get extSVGType => _extSVGType;

  /// 本地图片路径
  static const String pathAssets = 'assets/';
  static const String pathAssetsImage = '${pathAssets}images/';
  static const String pathAssetsIcon = '${pathAssetsImage}icons/';
  static const String pathAssetsBG = '${pathAssetsImage}backgrounds/';
  static const String pathAssetsLogo = '${pathAssetsImage}logos/';
  static const String pathAssetsDefault = '${pathAssetsImage}default/';
  static const String pathAssetsBanner = '${pathAssetsImage}banner/';

  String wrapBaseUrl(String url) {
    if (url.startsWith('http') || url.startsWith('https')) {
      return url;
    }
    return _netImagePrefix + url;
  }

  String wrapAssetsImage(String img, {String fileExtensions = _extPNGType}) {
    return pathAssetsImage + img + fileExtensions;
  }

  String wrapAssetsIcon(String img,
      {bool need1x = false, String fileExtensions = _extPNGType}) {
    return pathAssetsIcon + img + fileExtensions;
  }

  String wrapAssetsBG(String url, {String fileExtensions = _extPNGType}) {
    return pathAssetsBG + url + fileExtensions;
  }

  String wrapAssetsLogo(String url, {String fileExtensions = _extPNGType}) {
    return pathAssetsLogo + url + fileExtensions;
  }

  String wrapAssetsDefault(String url, {String fileExtensions = _extPNGType}) {
    return pathAssetsDefault + url + fileExtensions;
  }

  String wrapAssetsBanner(String url, {String fileExtensions = _extPNGType}) {
    return pathAssetsBanner + url + fileExtensions;
  }
}

class _ImgWidget {
  Widget netImage({
    required String imagePath,
    double? width,
    double? height,
    BoxFit fit = BoxFit.fill,
  }) {
    final img = Image.network(
      imagePath,
      fit: fit,
    );

    /// 网络图片使用frameBuilder或者loadingBuilder在图片加载时的占位展示
    return imageWidget(
      image: img,
      width: width,
      height: height,
    );
  }

  Widget assetsImage({
    required String imagePath,
    double? width,
    double? height,
    BoxFit fit = BoxFit.fill,
  }) {
    final img = imagePath.endsWith(ImageHelper.path.extSVGType)
        ? SvgPicture.asset(imagePath, fit: fit)
        : Image.asset(imagePath);

    return imageWidget(
      image: img,
      width: width,
      height: height,
    );
  }

  Widget imageWidget({
    required Widget image,
    double? width,
    double? height,
  }) {
    return SizedBox(
      width: width ?? 100,
      height: height ?? 100,
      child: image,
    );
  }

  Widget vPromptImg({
    required Widget image,
    String? text,
    TextStyle? textStyle,
    double? vGap = 10.0,
  }) {
    if (null != text) {
      TextStyle style = textStyle ??
          TextStyle(
            fontWeight: AppStyle.fontWidget.normal,
            color: Get.isDarkMode
                ? AppStyle.colors.white
                : AppStyle.colors.lightGray,
            fontSize: AppStyle.fontSize.small_12,
          );
      return image
          .addNeighbor(SizedBox(height: vGap))
          .addNeighbor(Text(text, style: style))
          .intoColumn(mainAxisAlignment: MainAxisAlignment.center);
    } else {
      return image
          .addNeighbor(SizedBox(height: vGap))
          .intoColumn(mainAxisAlignment: MainAxisAlignment.center);
    }
  }

  Widget vPromptImgWidget({
    required Widget image,
    Widget? textWidget,
  }) {
    return (null != textWidget)
        ? image
            .addNeighbor(textWidget)
            .intoColumn(mainAxisAlignment: MainAxisAlignment.center)
        : image;
  }
}
