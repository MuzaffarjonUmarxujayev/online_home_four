import 'package:flutter/material.dart';
import 'package:online_home_four/pages/home_page.dart';
import 'package:online_home_four/pages/intro_page.dart';
import 'package:online_home_four/pages/introhome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Intro Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeIntroPage(),
      routes: {
        HomePage.id: (context) => const HomePage(),
        IntroPage.id: (context) => const IntroPage(),
        HomeIntroPage.id: (context) => const HomeIntroPage(),
      },
    );
  }
}
