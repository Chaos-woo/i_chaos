import 'dart:async';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_chaos/base_framework/config/app_config.dart';
import 'package:i_chaos/ichaos/public/ali_icons.dart';
import 'package:i_chaos/ichaos/public/config/design_config.dart';
import 'package:i_chaos/ichaos/public/scenes/exception/common_exception_scene.dart';
import 'package:noripple_overscroll/noripple_overscroll.dart';
import 'package:oktoast/oktoast.dart';
import 'package:reflectable/reflectable.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'ichaos/todo/todo-domain/core/scenes/home/todo_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// app配置初始化
  await AppConfig.init();

  runZoned(
      () {
        ErrorWidget.builder = (FlutterErrorDetails details) {
          Zone.current.handleUncaughtError(details.exception, details.stack!);

          /// 出现异常时会进入下方页面（flutter原有的红屏）
          return ExceptionPageState(details.exception.toString(), details.stack.toString()).transformToPageWidget();
        };

      },
      zoneSpecification: ZoneSpecification(
        print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
          /// 日常输出日志拦截，可收集在发生异常时一并处理和上传日志
        },
      ),
      // ignore: deprecated_member_use
      onError: (Object object, StackTrace trace) {
        /// 可以将下面日志上传到服务器，用于release后的错误处理
        debugPrint(object.toString());
        debugPrint(trace.toString());
      });

  /// 实际启动页面
  runApp(const IChaosApp());

  /// 状态栏置透明
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
}

class IChaosApp extends StatelessWidget {
  const IChaosApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    setDesignWHD(DesignConfig.designWidth, DesignConfig.designHeight, density: DesignConfig.designDensity);
    return MaterialApp(
      title: 'iChaos',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      home: const OKToast(
        child: SafeArea(child: MainScene()),
      ),
    );
  }
}

class MainScene extends StatefulWidget {
  const MainScene({Key? key}) : super(key: key);

  @override
  _MainSceneState createState() => _MainSceneState();
}

class _MainSceneState extends State<MainScene> {
  int _currentIndex = 3;
  late PageController _pageController;

  final List<SalomonBottomBarItem> _bottomBarItems = [
    /// Money
    SalomonBottomBarItem(
      icon: const Icon(Icons.book),
      title: const Text("Asset"),
      selectedColor: Colors.orange,
    ),

    /// rss
    SalomonBottomBarItem(
      icon: const Icon(Icons.rss_feed),
      title: const Text("Feed"),
      selectedColor: Colors.lightBlueAccent,
    ),

    /// blog of me
    SalomonBottomBarItem(
      icon: const Icon(Icons.web),
      title: const Text("Me-log"),
      selectedColor: Colors.red[700],
    ),

    /// Todo list
    SalomonBottomBarItem(
      icon: const Icon(AliIcons.ALI_ICON_ACTIVITY),
      title: const Text("ToDO"),
      selectedColor: Colors.teal,
    ),
  ];

  final List<Widget> _tabPages = [
    Temporature(),
    Temporature(),
    Temporature(),
    TodoHomePage().transformToPageWidget(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 245, 245, 1),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        items: _bottomBarItems,
        duration: const Duration(milliseconds: 800),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            /// 保持页面状态，避免页面跳转时重复加载
            _pageController.jumpToPage(_currentIndex);
          });
        },
      ),
      body: NoRippleOverScroll(
        child: PageView(
          controller: _pageController,
          children: _tabPages,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
              _pageController.jumpToPage(_currentIndex);
            });
          },
        ),
      ),
    );
  }
}

class Temporature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


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
