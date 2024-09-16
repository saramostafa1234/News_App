import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_c11_mon/core/config/page_routes_name.dart';
import 'package:news_app_c11_mon/features/home/pages/home_viwe.dart';

import '../../features/home/views/home_viwe.dart';
import '../../features/splash/pages/splash_view.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutesName.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
      case PageRoutesName.home:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
    }
  }
}
