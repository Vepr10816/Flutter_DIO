import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dio/data/entity/user/user.dart';
import 'package:flutter_dio/presentation/screen/auth/sign_in.dart';
import 'package:flutter_dio/presentation/widgets/custom_button.dart';
import 'package:flutter_dio/presentation/widgets/text_field_obscure.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dio/state/cubit/profile/profile_cubit.dart';
import 'package:flutter_dio/state/cubit/profile/profile_state.dart';



class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  static const routeName = '/Profile';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  GlobalKey<FormState> _key = GlobalKey();

  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _middleNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _loginController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _newpasswordController = TextEditingController();
  bool isObscure = false;


@override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _key,
            child:  BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state)
              {
                _emailController.text = state.email;
                _loginController.text = state.userName;
                return 
            Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Spacer(),
                    const Text(
                      '???????????????????????????? ??????????????',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 26),
                    ),
                    const Spacer(),
                    TextFormField(
                      maxLength: 30,
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '???????? ?????????????????????? ?????????? ????????????';
                        }
                        if (!isValidEmail(value)) {
                          return '???????????????????????? ???????? ?????????????????????? ??????????';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      maxLength: 16,
                      controller: _loginController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '???????? ?????????? ????????????';
                        }
                        if (value.length < 3) {
                          return '?????????? ???????????? ???????? ???? ?????????? 3 ????????????????';
                        }
                        if (isValidFIOLogin(value)) {
                          return '?????????? ???????????? ?????????????????? ???????????? ???????? ?????????????? ?? ???????? ?????????????????? ??????????';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: '??????????',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    CustomButton(
                      content: '??????????????????',
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          updUser();
                        } else {}
                      },
                    ),
                   /* const SizedBox(height: 20),
                    TextFormField(
                      maxLength: 8,
                      controller: _passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '???????? ?????????????? ???????????? ????????????';
                        }
                        return null;
                      },
                      obscureText: isObscure,
                      decoration: InputDecoration(
                        hintText: '???????????? ????????????',
                        suffixIcon: TextFieldObscure(isObscure: (value) {
                          setState(() {
                            isObscure = value;
                          });
                        }),
                        border: const OutlineInputBorder(),
                      ),
                    ),

                     const SizedBox(height: 20),
                    TextFormField(
                      maxLength: 8,
                      controller: _newpasswordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '???????? ???????????? ???????????? ????????????';
                        }
                        return null;
                      },
                      obscureText: isObscure,
                      decoration: InputDecoration(
                        hintText: '?????????? ????????????',
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
                      content: '??????????????????',
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          updUserPassword();
                        } else {}
                      },
                    ),*/

                    const Spacer(flex: 3),
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }

  void updUser() async {
    context.read<ProfileCubit>().updateUser(User(
      userName: _loginController.text,
      email: _emailController.text,
      password: _passwordController.text
    ));
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('???????????????? ???????????????????? ????????????'),
        ),
      );

  }

  void updUserPassword() async {
    context.read<ProfileCubit>().updateUserPassword(_passwordController.text, _newpasswordController.text);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('???????????????? ???????????????????? ????????????'),
        ),
      );

  }

  bool isValidPassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool isValidEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool isValidFIOLogin(String value) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
