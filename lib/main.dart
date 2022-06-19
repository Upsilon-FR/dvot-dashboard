

import 'package:dvot_dashboard_init/pages/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      title: "DVOT - Dashboard",
      theme: ThemeData(
        backgroundColor: const Color(0xffe5e5e5),
        primaryColor: const Color(0xff0762C8),
        cardColor: const Color(0xfff1f7ff)
      ),
    );
  }
}
