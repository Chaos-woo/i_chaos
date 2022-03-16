
// 抽象命名路由页面配置
import 'package:get/get_navigation/src/routes/get_route.dart';

abstract class RoutePages {
    static final List<GetPage> routes = [];

    // 路由初始化
    void initRoutes();
}