
// https://blog.csdn.net/weixin_42320543/article/details/119793419
// BlurHash图片缩略图
class ImageMeta {
  late double width;
  late double height;

  ImageMeta({required this.width, required this.height});

  ImageMeta.all(double size) {
    width = size;
    height = size;
  }
}
