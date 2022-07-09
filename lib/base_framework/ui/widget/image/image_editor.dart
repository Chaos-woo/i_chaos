/*
* Author : LiJiqqi
* Date : 2020/4/24
*/

import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:i_chaos/base_framework/utils/image_helper.dart';
import 'package:i_chaos/base_framework/widget_state/page_state.dart';
import 'package:i_chaos/generated/l10n.dart';
import 'package:image_editor/image_editor.dart' as ie;

///图片存储在了沙盒里，理论上兼容华为

class ImageEditorState extends PageState {
  final String name;

  ///图片名字

  final Uint8List memoryImage;

  ///图片数量

  ImageEditorState({required this.name, required this.memoryImage});

  final GlobalKey<ExtendedImageEditorState> editorKey =
      GlobalKey<ExtendedImageEditorState>();

  @override
  Widget build(BuildContext context) {
    return switchStatusBar2Dark(
        isSetDark: true,
        child: Container(
          color: Colors.white,
          width: 750.w,
          height: 1334.h,
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Container(
                child: Center(
                  child: ExtendedImage.memory(
                    memoryImage,
                    fit: BoxFit.contain,
                    mode: ExtendedImageMode.editor,
                    enableLoadState: true,
                    extendedImageEditorKey: editorKey,
                    initEditorConfigHandler: (state) {
                      return EditorConfig(
                        maxScale: 8.0,
                        cropRectPadding: const EdgeInsets.all(20.0),
                        hitTestSize: 20.0,
                        initCropRectType: InitCropRectType.imageRect,
                      );
                    },
                  ),
                ),
              )),
              bottomBar(),
            ],
          ),
        ));
  }

  bottomBar() {
    return Container(
      color: Colors.white,
      height: 100.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          OutlinedButton(
            onPressed: () {
              editorKey.currentState!.reset();
            },
            style: ButtonStyle(
              side: MaterialStateProperty.resolveWith<BorderSide>(
                (Set<MaterialState> states) {
                  return BorderSide(
                      color: Colors.black54, width: 2.w);
                },
              ),
            ),
            child: Text(
              S.of(context).bedrock_reset,
              style: TextStyle(color: Colors.black54, fontSize: 28.sp),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              saveImage();
            },
            style: ButtonStyle(
              side: MaterialStateProperty.resolveWith<BorderSide>(
                (Set<MaterialState> states) {
                  return BorderSide(
                      color: Colors.black54, width: 2.w);
                },
              ),
            ),
            child: Text(
              S.of(context).bedrock_confirm,
              style: TextStyle(color: Colors.black54, fontSize: 28.sp),
            ),
          ),
        ],
      ),
    );
  }

  saveImage() async {
    Rect rect = editorKey.currentState!.getCropRect()!;
    var data = editorKey.currentState!.rawImageData;
    ie.ImageEditorOption option = ie.ImageEditorOption();
    option.addOption(ie.ClipOption.fromRect(rect));
    await ie.ImageEditor.editImage(image: data, imageEditorOption: option)
        .then((result) {
      ImageHelper.saveImage(name, result!).then((path) {
        pop(result: path);
      });
    });
  }
}
