import 'package:flutter/material.dart';
import 'package:wallpapers/core/routes/routes.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  
  final _forRoutes = Routes();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpapers',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     initialRoute: '/splash',
     onGenerateRoute: _forRoutes.routeGenerate,    
    );
  }
}
