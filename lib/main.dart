import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dio/presentation/screen/auth/sign_in.dart';
import 'package:flutter_dio/presentation/screen/auth/sign_up.dart';
import 'package:flutter_dio/presentation/screen/main/finance_data.dart';
import 'package:flutter_dio/state/cubit/auth_cubit.dart';
import 'package:flutter_dio/user.dart';

import 'locator_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
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
        SignUp.routeName: (_) => BlocProvider(
              create: (context) => sl<AuthCubit>(),
              child: SignUp(),
            ),
        SignIn.routeName: (_) => BlocProvider(
              create: (context) => sl<AuthCubit>(),
              child: SignIn(),
            ),
      },
    initialRoute: SignIn.routeName,
    );
  }
}
