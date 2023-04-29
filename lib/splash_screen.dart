import 'dart:async';

import 'package:flutter/material.dart';

import 'food_home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    navigatePage();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Flutter App',
          style: TextStyle(color: Colors.black, fontSize: 25,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void navigatePage() async {
    Timer(
        const Duration(seconds: 3),
        () => {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FoodHomeScreen()))
            });
  }
}
