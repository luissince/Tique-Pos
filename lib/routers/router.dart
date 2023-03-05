import 'package:flutter/material.dart';

import '../ui/pages/saleslist/saleslist_page.dart';
import '../ui/pages/configuration/configuration_page.dart';
import '../ui/pages/home/home_page.dart';
import '../ui/pages/login/login_page.dart';
import '../ui/pages/newsale/newsale_page.dart';
import '../ui/pages/splash/splash_page.dart';

Map<String, WidgetBuilder> routers = <String, WidgetBuilder>{
  SplashPage.id: (_) => const SplashPage(),
  LoginPage.id: (_) => const LoginPage(),
  HomePage.id: (_) => const HomePage(),
  CongiturationPage.id: (_) => const CongiturationPage(),
  NewSalePage.id: (_) => const NewSalePage(),
  SalesListPage.id: (_) => const SalesListPage(),
};
