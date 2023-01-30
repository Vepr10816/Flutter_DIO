import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dio/presentation/screen/auth/sign_in.dart';
import 'package:flutter_dio/presentation/screen/auth/sign_up.dart';
import 'package:flutter_dio/presentation/screen/main/finance_data.dart';
import 'package:flutter_dio/user.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  //await Dio().put('http://127.0.0.1:8081/token', data: User(userName: 'qwe', email: 'qwe@mail.ru', password: '123'));
  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        FinanceData.routeName: (context) => const FinanceData(),
        SignUp.routeName: (context) => const SignUp(),
        SignIn.routeName: (context) => const SignIn()
      },
      home: const SignIn(),
    );
  }
}