import 'package:flutter/material.dart';

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
          ],
        ),
      ),
    );
  }
}