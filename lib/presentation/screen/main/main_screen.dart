import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../state/cubit/list_cubit.dart';
import '../../../state/cubit/list_state.dart';
import '../../widgets/cutom_search_delegate.dart';
import '../auth/sign_in.dart';
import '../financedata/finance_data.dart';
import '../financedata/profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  
  static const routeName = '/main';

  @override
  State<MainScreen> createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  int currentIndex = 0;
  final listPage = [FinanceData(),Profile(),];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCubit, ListState>(
              builder: (context, state)
              { return Scaffold(
      appBar: AppBar(title: const Text("Финансы"),
      actions: [
        IconButton(onPressed: ()
        {
          List a = context.read<ListCubit>().state.operationNameList;
          CustomSearchDelegate st = CustomSearchDelegate();
          st.searchTerms = a;
          showSearch(context: context, delegate: st);
        }, 
        icon: const Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
      ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap:(index){
          setState((){
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label:'Заметки',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label:'Профиль'
          )
        ]
      ),
      body: listPage[currentIndex],
    );
              }
    );
  }
}