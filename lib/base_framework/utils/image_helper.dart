import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';

class ImageHelper {
  static const String baseUrl = 'http://www.baidu.com';
  static const String imagePrefix = '$baseUrl/';

  static const String extensionsPNGType = ".png";
  static const String extensionsSVGType = ".svg";

  static String addWebp(String url) {
    return "$url.webp";
  }

  ///缩略图

  static String convertSmallUrl(String url) {
    return addWebp("$url.small");
  }

  ///详情图
  static String convertRegularUrl(String url) {
    return addWebp(url);
  }

  static String wrapUrl(String url) {
    if (url.startsWith('http')) {
      return url;
    } else {}
    return imagePrefix + url;
  }

  static String wrapAssets(String url, {String fileExtensions = extensionsPNGType}) {
    return "assets/images/" + url + fileExtensions;
  }

  static String wrapAssetsIcon(String url, {bool need1x = false, String fileExtensions = extensionsPNGType}) {
    return 'assets/images/icons/${need1x ? "/1.0x" : ""}' + url + fileExtensions;
  }

  static String wrapAssetsBG(String url, {String fileExtensions = extensionsPNGType}) {
    return 'assets/images/backgrounds/' + url + fileExtensions;
  }

  static String wrapAssetsLogo(String url, {String fileExtensions = extensionsPNGType}) {
    return 'assets/images/logos/' + url + fileExtensions;
  }

  static String wrapAssetsDefault(String url, {String fileExtensions = extensionsPNGType}) {
    return 'assets/images/default/' + url + fileExtensions;
  }

  static String wrapAssetsBanner(String url, {String fileExtensions = extensionsPNGType}) {
    return 'assets/images/backgrounds/banner/' + url + fileExtensions;
  }

  static Widget placeHolder({required double width, double? height}) {
    return SizedBox(width: width, height: height, child: CupertinoActivityIndicator(radius: min(10.0, width / 3)));
  }

  static Widget placeHolderLocalImg({required String imageName, double? width, double? height}) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.asset(
        wrapAssets(imageName),
        fit: BoxFit.fill,
      ),
    );
  }

  static Widget placeHolderLocalSVGImg({required String imageName, double? width, double? height}) {
    return SizedBox(
      width: width,
      height: height,
      child: SvgPicture.asset(
        wrapAssets(imageName, fileExtensions: extensionsSVGType),
        fit: BoxFit.fill,
      ),
    );
  }

  /// * 从相册选择或者拍照一张照片picker   插件：MultiImagePicker

//  static Future<List<Asset>> pickImage({int maxImages = 1}) async {
//    List<Asset> images = [];
//    List<Asset> resultList = [];
//    String error = 'No Error Dectected';
//    try {
//      resultList = await MultiImagePicker.pickImages(
//        maxImages: maxImages,
//        enableCamera: true,
//        selectedAssets: images,
//        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
//        materialOptions: MaterialOptions(
//          actionBarColor: "#abcdef",
//          actionBarTitle: "Bedrock App",
//          allViewTitle: "All Photos",
//          useDetailsView: false,
//          selectCircleStrokeColor: "#000000",
//        ),
//      );
//    } on Exception catch (e) {
//      error = e.toString();
//    }
//
//    return resultList;
//  }

  /// * 保存图片到临时路径
  static Future<String> saveImage(String name, Uint8List fileData) async {
    //Image image = Image.memory(fileData);
    Directory tempDir = await getTemporaryDirectory();
    debugPrint(tempDir.path);
    File file = File("${tempDir.path}/$name.png");
    file.writeAsBytesSync(fileData);
    debugPrint(file.path);
    return file.path;

    //return await ImagePickerSaver.saveFile(fileData: fileData);
  }
}
