import 'package:flutter/material.dart';
import 'package:food_demo_app/presentation/food_bloc/food_bloc.dart';

import 'splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FoodBloc>(
          create: (context) => FoodBloc(),
        ),
      ],

      child:  const MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
