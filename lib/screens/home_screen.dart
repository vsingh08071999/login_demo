import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_demo/bloc/test_bloc.dart';
import 'package:login_demo/widgets/drawer_widget.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(" Home Screen")),
        drawer: DrawerWidget(),
        body: Center(
          child: RaisedButton(
              onPressed: () async {
                await context.read<TestBloc>().updateEmail(false);
                await context.read<TestBloc>().updatePassword(false);
                await context.read<TestBloc>().updateEmailAndPassword('', '');
                Fluttertoast.showToast(msg: "Logout successfully");
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text("LOGOUT", style: TextStyle(color: Colors.white)),
              color: Colors.teal),
        ));
  }
}
