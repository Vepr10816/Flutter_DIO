import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dio/presentation/screen/auth/sign_up.dart';
import 'package:flutter_dio/presentation/screen/main/finance_data.dart';
import 'package:flutter_dio/presentation/widgets/custom_button.dart';
import 'package:flutter_dio/presentation/widgets/text_field_obscure.dart';

import '../../../user.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  static const routeName = '/signin';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> _key = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isObscure = true;
  bool _isValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Expanded(child: SizedBox()),
                const Text(
                  'Учет финансов',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26),
                ),
                const Expanded(child: SizedBox()),
                TextFormField(
                  controller: _loginController,
                  validator: (value) {
                    if (!_isValid) {
                      return null;
                    }
                    if (value!.isEmpty) {
                      return 'Поле логин пустое';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Логин',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (!_isValid) {
                      return null;
                    }
                    if (value!.isEmpty) {
                      return 'Поле пароль пустое';
                    }
                    return null;
                  },
                  obscureText: isObscure,
                  decoration: InputDecoration(
                    labelText: 'Пароль',
                    suffixIcon: TextFieldObscure(isObscure: (value) {
                      setState(() {
                        isObscure = value;
                      });
                    }),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  content: 'Войти',
                  onPressed: () {
                    _isValid = true;
                    if (_key.currentState!.validate()) {
                      signIn();
                    } else {}
                  },
                ),
                const Expanded(flex: 3, child: SizedBox()),
                InkWell(
                  borderRadius: BorderRadius.circular(4),
                  onTap: () {
                    _loginController.clear();
                    _passwordController.clear();
                    _isValid = false;
                    _key.currentState!.validate();
                    Navigator.pushNamed(context, SignUp.routeName);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Регистрация в системе',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
 
  void signIn() async {
    try{
      final result = await Dio().post('http://127.0.0.1:8081/token',
      data: User(
        userName: _loginController.text,
        email: null.toString(),
        password: _passwordController.text));
      Navigator.pushNamed(context, FinanceData.routeName);
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Не верный логин или пароль"),
        ),
      );
    }
  }
}
