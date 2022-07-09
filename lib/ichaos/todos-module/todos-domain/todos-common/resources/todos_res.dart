// ignore_for_file: prefer_function_declarations_over_variables, unused_field

import 'package:i_chaos/base-getX-framework/commons/base-module/image-module/image_meta.dart';
import 'package:i_chaos/base-getX-framework/utils/image_helper.dart';

class TodosRes {
  static final images = _Images();
}

class _Images {
  static const double _defaultImgWidth = 150.0;
  static const double _defaultImgHeight = 150.0;

  static final _imgDefaultWidgetSize = () => ImageMeta(width: _defaultImgWidth, height: _defaultImgHeight);
  static final _imgWidget = (String imgPath, {ImageMeta? imageSize}) {
    ImageMeta imgSize = imageSize ?? _imgDefaultWidgetSize.call();
    return ImageHelper.imgWidget.assetsImage(
      imagePath: imgPath,
      width: imgSize.width,
      height: imgSize.height,
    );
  };

  // 图片路径
  static final _loadingImgPath = ImageHelper.path.wrapAssetsImage('loading', fileExtensions: ImageHelper.path.extSVGType);
  static final _searchEmptyImgPath = ImageHelper.path.wrapAssetsImage('image_search_empty', fileExtensions: ImageHelper.path.extSVGType);
  static final _todosCompleteImgPath = ImageHelper.path.wrapAssetsImage('image_complete', fileExtensions: ImageHelper.path.extSVGType);
  static final _remainTodosImgPath = ImageHelper.path.wrapAssetsImage('image_task', fileExtensions: ImageHelper.path.extSVGType);

  // 图片容器
  final loading = _imgWidget(_loadingImgPath);
  final searchEmpty = _imgWidget(_searchEmptyImgPath);
  final todosComplete = _imgWidget(_searchEmptyImgPath);
  final remainTodos = _imgWidget(_searchEmptyImgPath);
}
