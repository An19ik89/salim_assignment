import 'package:flutter/material.dart';
import 'package:salim_assignment/basic_bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        bottomNavigationBarTheme: BottomNavigationBarTheme.of(context).copyWith(
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.yellow,
          backgroundColor: Colors.black45,
        ),
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page',menuScreenContext: context,),
      home: const BasicBottomNavBar(),
    );
  }
}
