import 'package:i_chaos/base_framework/view_model/app_model/device_model.dart';
import 'package:i_chaos/base_framework/view_model/app_model/locale_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

/// 应用级 独立 model(通过consumer 可以在任意页面获取到)
List<SingleChildWidget> independentServices = [
  //ChangeNotifierProvider<ThemeModel>.value(value: ThemeModel()),  // 主题配置
  ChangeNotifierProvider<LocaleModel>.value(value: LocaleModel()), // 国际化
  //设备model
  ChangeNotifierProvider<DeviceModel>.value(value: DeviceModel()), // 设备
];

/// 需要依赖的model,下方注释代码为例子
/// eg :UserModel 购物车model的组合（如购物车与用户ID绑定）
List<SingleChildWidget> dependentServices = [
//  ChangeNotifierProxyProvider<GlobalCartGoodsModel, UserModel>(
//    update: (context, globalCartGoodsModel, userModel) =>
//    userModel ?? UserModel(globalCartGoodsModel: globalCartGoodsModel),
//  ),
//
//  ChangeNotifierProxyProvider<UserModel,StoreModel>(
//    update: (context,userModel,storeModel)
//    => storeModel ?? StoreModel(userModel: userModel,cartGoodsModel: userModel.globalCartGoodsModel),
//  ),
];
