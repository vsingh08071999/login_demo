import 'package:flutter_bloc/flutter_bloc.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestState.initial());
  bool _isEmail = false;
  bool _isPassword = false;
  String _email = '';
  String _password = '';
  @override
  Stream<TestState> mapEventToState(TestEvent event) async* {
    switch (event) {
      case TestEvent.setUpadte:
        yield state.copyWith(
            isEmail: _isEmail,
            isPassword: _isPassword,
            email: _email,
            password: _password);
    }
  }

  updateEmail(bool value) {
    _isEmail = value;
    add(TestEvent.setUpadte);
    print("isEmail is $_isEmail");
  }

  updatePassword(bool value) {
    _isPassword = value;
    add(TestEvent.setUpadte);
    print("isPassword is $_isPassword");
  }

  updateEmailAndPassword(String email, String password) {
    _email = email;
    _password = password;
    add(TestEvent.setUpadte);
    print("isEmail is $_email   &   $_password");
  }
}

class TestState {
  bool? isEmail = false;
  bool? isPassword = false;
  String? email;
  String? password;
  TestState({this.isEmail, this.isPassword, this.email, this.password});
  factory TestState.initial() {
    return TestState(
        isEmail: false, isPassword: false, email: '', password: '');
  }
  TestState copyWith(
      {bool? isEmail, bool? isPassword, String? email, String? password}) {
    return TestState(
        isEmail: isEmail ?? this.isEmail,
        isPassword: isPassword ?? this.isPassword,
        email: email ?? this.email,
        password: password ?? this.password);
  }
}

enum TestEvent { setUpadte }
