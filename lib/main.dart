// ignore_for_file: no_logic_in_create_state

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_chaos/base_framework/config/app_config.dart';
import 'package:i_chaos/ichaos/common-module/exception/default_exception_page.dart';
import 'package:i_chaos/my_material_app.dart';
import 'package:reflectable/reflectable.dart';


//void main() async {
//  WidgetsFlutterBinding.ensureInitialized();
//
//  /// app配置初始化
//  await AppConfig.init();
//
//  runZoned(() {
//    ErrorWidget.builder = (FlutterErrorDetails details) {
//      Zone.current.handleUncaughtError(details.exception, details.stack!);
//
//      /// 出现异常时会进入下方页面（flutter原有的红屏）
//      return ExceptionPageState(details.exception.toString(), details.stack.toString()).transformToPageWidget();
//    };
//  }, zoneSpecification: ZoneSpecification(
//    print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
//      /// 日常输出日志拦截，可收集在发生异常时一并处理和上传日志
//    },
//  ),
//      // ignore: deprecated_member_use
//      onError: (Object object, StackTrace trace) {
//    /// 可以将下面日志上传到服务器，用于release后的错误处理
//    debugPrint(object.toString());
//    debugPrint(trace.toString());
//  });
//
//  /// 实际启动页面
//  runApp(const IChaosApp());
//
//  /// 状态栏置透明
//  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
//}
//
//class IChaosApp extends StatelessWidget {
//  const IChaosApp({Key? key}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    setDesignWHD(DesignConfig.designWidth, DesignConfig.designHeight, density: DesignConfig.designDensity);
//    return MultiProvider(
//      providers: providers,
//      child: Consumer<LocaleModel>(
//        builder: (ctx, localeModel, _) {
//          return MaterialApp(
//            title: 'iChaos',
////            theme-setting: ThemeData(
////              primarySwatch: Colors.teal,
////            ),
//            debugShowCheckedModeBanner: false,
//            locale: localeModel.locale,
//            // 国际化工厂代理
//            localizationsDelegates: const [
//              // Intl 插件（需要安装）
//              S.delegate,
//              // 系统控件 国际化
//              GlobalCupertinoLocalizations.delegate,
//              GlobalMaterialLocalizations.delegate,
//              GlobalWidgetsLocalizations.delegate //文本方向等
//            ],
//            supportedLocales: S.delegate.supportedLocales,
//            home: OKToast(
//              child: mainScene,
//            ),
//          );
//        },
//      ),
//    );
//  }
//}
//
//MainScene mainScene = MainScene();
//
//class MainScene extends StatefulWidget {
//  MainScene({Key? key}) : super(key: key);
//
//  final _MainSceneState _mainSceneState = _MainSceneState();
//
//  void switchMainSceneTap(int tapIndex) {
//    _mainSceneState.switchTap(tapIndex);
//  }
//
//  @override
//  _MainSceneState createState() => _mainSceneState;
//}
//
//class _MainSceneState extends State<MainScene> {
//  int _currentIndex = 3;
//  late PageController _pageController;
//
//  final List<SalomonBottomBarItem> _bottomBarItems = [
//    /// Money
//    SalomonBottomBarItem(
//      icon: const Icon(AliIcons.IconCoupons),
//      title: const Text("Asset"),
//      selectedColor: Colors.orange,
//    ),
//
//    /// rss
//    SalomonBottomBarItem(
//      icon: const Icon(AliIcons.IconShake),
//      title: const Text("Feed"),
//      selectedColor: Colors.lightBlueAccent,
//    ),
//
//    /// blog of me
//    SalomonBottomBarItem(
//      icon: const Icon(AliIcons.IconWorkbench),
//      title: const Text("Me-log"),
//      selectedColor: Colors.red[700],
//    ),
//
//    /// Todo list
//    SalomonBottomBarItem(
//      icon: const Icon(AliIcons.IconActivity),
//      title: const Text("ToDOs"),
//      selectedColor: Colors.teal,
//    ),
//
//    /// Setting
//    SalomonBottomBarItem(
//      icon: const Icon(AliIcons.IconSetup),
//      title: const Text("Setting"),
//      selectedColor: Colors.black54,
//    ),
//  ];
//
//  final List<Widget> _tabPages = [
//    Temporature(),
//    Temporature(),
//    Temporature(),
//    PageTodoHome().transformToPageWidget(),
//    PageSettingHome().transformToPageWidget(),
//  ];
//
//  @override
//  void initState() {
//    super.initState();
//    _pageController = PageController(initialPage: _currentIndex);
//  }
//
//  void switchTap(int index) {
//    setState(() {
//      _currentIndex = index;
//      /// 保持页面状态，避免页面跳转时重复加载
//      _pageController.jumpToPage(_currentIndex);
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: const Color.fromRGBO(244, 245, 245, 1),
//      bottomNavigationBar: SalomonBottomBar(
//        currentIndex: _currentIndex,
//        items: _bottomBarItems,
//        duration: const Duration(milliseconds: 800),
//        onTap: (index) {
//          switchTap(index);
//        },
//      ),
//      body: NoRippleOverScroll(
//        child: PageView(
//          controller: _pageController,
//          physics: const NeverScrollableScrollPhysics(),
//          children: _tabPages,
//          onPageChanged: (index) {
//            switchTap(index);
//          },
//        ),
//      ),
//    );
//  }
//}
//
//class Temporature extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Center(
//        child: Text(S.of(context).common_designing_label),
//      ),
//    );
//  }
//}

// todo
@myReflect
class WorkList {
  test({String? n, String? m}) {
    print('  test method   $n');
  }
}

const myReflect = MyReflectable();

class MyReflectable extends Reflectable {
  const MyReflectable() : super(invokingCapability);
}

void main() async {
  // 确认flutter初始化完成
  WidgetsFlutterBinding.ensureInitialized();

  /// app配置初始化
  await AppConfig.init();

  runZoned(() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);

      /// 出现异常时会进入下方页面（flutter原有的红屏）
      return ExceptionPageState(details.exception.toString(), details.stack.toString());
    };
  }, zoneSpecification: ZoneSpecification(
    print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
      /// 日常输出日志拦截，可收集在发生异常时一并处理和上传日志
    },
  ),
      // ignore: deprecated_member_use
      onError: (Object object, StackTrace trace) {
    /// 可以将下面日志上传到服务器，用于release后的错误处理
//    debugPrint(object.toString());
//    debugPrint(trace.toString());
  });

  /// 实际启动页面
  runApp(MyMaterialApp());

  /// 状态栏置透明
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}
