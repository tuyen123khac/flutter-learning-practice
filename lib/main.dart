import 'package:flutter/material.dart';
import 'package:flutter_learning_practice/navigations/navigation_manager.dart';
import 'package:flutter_learning_practice/navigations/route_names.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learning',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: NavigationManager.getRoutes,
      initialRoute: RouteNames.mainRoute,
    );
  }
}
