import 'package:flutter/material.dart';
import 'package:news_app_c11_mon/core/config/app_router.dart';
import 'package:news_app_c11_mon/core/config/appliction_theme_manager.dart';
import 'package:news_app_c11_mon/core/config/page_routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ApplictionThemeManager.themeData,
      debugShowCheckedModeBanner: false,
      initialRoute: PageRoutesName.initial,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
