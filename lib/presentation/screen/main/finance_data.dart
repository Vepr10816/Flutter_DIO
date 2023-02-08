import 'package:flutter/material.dart';

import '../auth/sign_in.dart';

class FinanceData extends StatelessWidget {
  const FinanceData({super.key});
  
  static const routeName = '/finance';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Следующая страница")),
      body: Container(
        child: Column(
          children: <Widget>[
            Text("Успешная авторизация!"),
            const Spacer(flex: 3),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, SignIn.routeName),
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(15),
                        ),
                        child:
                            const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
          ],
        ),
      ),
    );
  }
}