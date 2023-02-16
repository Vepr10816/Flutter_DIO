class FinanceParametrsState {
  final int id;
  final String operationName;
  final String description;
  final String operationDate;
  final double operationTotal;
  final bool isDeleted;
  final int idCategory;

  final List<String> categotyNameList;
  final List idCategoryList;

  const FinanceParametrsState({required this.id,required this.operationName,required this.description, required this.operationDate, required this.operationTotal, required this.isDeleted, required this.idCategory, required this.categotyNameList, required this.idCategoryList});
}

