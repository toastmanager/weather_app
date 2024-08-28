import 'package:auto_route/auto_route.dart';
import 'package:weather_app/core/routes/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: ForecastRoute.page),
        AutoRoute(path: '/settings', page: SettingsRoute.page),
      ];
}
