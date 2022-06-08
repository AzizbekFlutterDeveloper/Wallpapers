import 'package:flutter/material.dart';
import 'package:wallpapers/screens/error_page.dart';
import 'package:wallpapers/screens/home_page.dart';
import 'package:wallpapers/screens/image_page.dart';
import 'package:wallpapers/screens/search_page.dart';
import 'package:wallpapers/screens/splash_page.dart';

class Routes {
  Route routeGenerate(RouteSettings settings){
    final arg = settings.arguments;
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (context) => const SplashPage(),);
      case '/home':
        return MaterialPageRoute(builder: (context) => const  HomePage(),);
      case '/search':
        return MaterialPageRoute(builder: (context) => const SearchPage(),);
      case '/image':
        return MaterialPageRoute(builder: (context) => ImagePage(image: (arg as List)[0],index: (arg as List)[1],),);

      default:
       return MaterialPageRoute(builder: (context) =>const ErrorPage(),);
    }
  }
}