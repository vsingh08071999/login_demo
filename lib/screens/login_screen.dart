import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_demo/bloc/test_bloc.dart';
import 'package:login_demo/widgets/textfield.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Screen"),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFieldWidget(
                      labletext: "Enter Email id",
                      hintText: "abc@gmail.com",
                      inputValidate: validationKey.email,
                      controller: _emailController,
                      isIconShow: false,
                      suffixIcon: IconButton(
                          icon: Icon(Icons.arrow_drop_down), onPressed: null),
                      maxline: 1,
                      errorMaxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false),
                  SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                      labletext: "Enter Password",
                      hintText: "Abc@1234",
                      inputValidate: validationKey.password,
                      controller: _passwordController,
                      isIconShow: true,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      maxline: 1,
                      errorMaxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: _passwordVisible),
                  SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<TestBloc, TestState>(builder: ((context, state) {
                    return state.isEmail! && state.isPassword!
                        ? loginButton()
                        : SizedBox();
                  }))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton() {
    return Material(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.teal,
        elevation: 0.0,
        child: MaterialButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              await context.read<TestBloc>().updateEmailAndPassword(
                  _emailController.text, _passwordController.text);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            }
          },
          minWidth: MediaQuery.of(context).size.width,
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
        ));
  }

  Widget submitButton(
      TextEditingController email, TextEditingController password) {
    return GestureDetector(
      onTap: () async {
        if (_formKey.currentState!.validate()) {
          await context
              .read<TestBloc>()
              .updateEmailAndPassword(email.text, password.text);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      },
      child: Container(
        padding: new EdgeInsets.symmetric(vertical: 5.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            color: Colors.teal),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
