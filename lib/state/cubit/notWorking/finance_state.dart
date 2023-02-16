part of 'finance_cubit.dart';



abstract class FinanceState {
  const FinanceState();
}

class InitialState extends FinanceState{}

class FinanceListState extends FinanceState{
  final List operationNameList;
  final List idFinanceList;

  FinanceListState({required this.operationNameList, required this.idFinanceList});
}

class FinanceParametrsState extends FinanceState{
  final Financedata financedata;
  FinanceParametrsState({required this.financedata});
}


