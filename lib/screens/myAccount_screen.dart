import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_demo/bloc/test_bloc.dart';

class MyAccountScreen extends StatefulWidget {
  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("My Account Screen")),
        body: Center(
          child: Text(
              "Email: " + context.read<TestBloc>().state.email.toString(),
              style: TextStyle(color: Colors.teal, fontSize: 20)),
        ));
  }
}
