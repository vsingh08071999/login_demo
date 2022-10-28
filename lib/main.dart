import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_demo/bloc/test_bloc.dart';
import 'package:login_demo/screens/login_screen.dart';

void main() {
  runApp(BlocProvider(
    create: ((context) => TestBloc()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        debugShowCheckedModeBanner: false,
        home: LoginScreen());
  }
}
