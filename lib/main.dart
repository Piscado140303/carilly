import 'package:flutter/material.dart';
import 'routes.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:'/welcomePage' ,
      routes: routes,
    );
  }
}
