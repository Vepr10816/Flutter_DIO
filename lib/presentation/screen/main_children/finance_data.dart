import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dio/data/entity/financedata/financedata.dart';
import 'package:flutter_dio/state/cubit/financeList/finance_list_cubit.dart';
import 'package:flutter_dio/state/cubit/financeList/finance_list_state.dart';
import 'package:flutter_dio/state/cubit/financeParametrs/finance_parametrs_cubit.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/text_field_obscure.dart';
import '../auth/sign_in.dart';

class FinanceData extends StatefulWidget {
  const FinanceData({super.key});

  static const routeName = '/finance';

  @override
  State<FinanceData> createState() => _FinanceData();
}

class _FinanceData extends State<FinanceData> {
  String dropdownValue = 'Dog';
  List<String> categoryList = [];
  String screenTitle = '';

  GlobalKey<FormState> _key = GlobalKey();

  TextEditingController _operationNameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _operationDate = TextEditingController();
  TextEditingController _operationTotal = TextEditingController();
  TextEditingController _isDeletedController = TextEditingController();
  TextEditingController _idCategoryController = TextEditingController();
  TextEditingController _dropdownController = TextEditingController();
  bool isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              setState(() {
                context.read<FinanceParametrsCubit>().logicalReturn().then(
                    (value) =>
                        context.read<FinanceListCubit>().getFinanceList());
              });
            },
            child: const Text("Логиеское восстановление")),
        ElevatedButton(
            onPressed: () {
              setState(() {
                showAddScreen();
                /*SimpleDialog(
                          children: [
                            const Spacer(),
                            const Text(
                              'Добавление',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 26),
                            ),
                            const Spacer(),
                            TextFormField(
                              controller: _operationNameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Поле названия оперции пустое';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: 'Наименование операции',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _descriptionController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Поле описания пустое';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: 'Описание',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _operationTotal,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Поле суммы операции пустое';
                                }
                                return null;
                              },
                              obscureText: isObscure,
                              decoration: InputDecoration(
                                hintText: 'Сумма',
                                suffixIcon:
                                    TextFieldObscure(isObscure: (value) {
                                  setState(() {
                                    isObscure = value;
                                  });
                                }),
                                border: const OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _operationDate,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Поле даты пустое';
                                }
                                return null;
                              },
                              obscureText: isObscure,
                              decoration: InputDecoration(
                                hintText: 'Дата',
                                suffixIcon:
                                    TextFieldObscure(isObscure: (value) {
                                  setState(() {
                                    isObscure = value;
                                  });
                                }),
                                border: const OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 20),
                            CustomButton(
                                content: 'Добавить',
                                onPressed: () {
                                  ADDFinance();
                                }),
                            const Spacer(flex: 3),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(15),
                                ),
                                child: const Icon(Icons.arrow_back,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        )));*/
              });
            },
            child: const Text("Добавить")),
        Expanded(
          child: SizedBox(
              height: 500.0,
              child: BlocConsumer<FinanceListCubit, FinanceListState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: state.operationNameList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      context
                                          .read<FinanceListCubit>()
                                          .deleteFromFinanceList(index);
                                    });
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      showUpdateScreen(index);
                                    });
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () {
                                    context
                                        .read<FinanceParametrsCubit>()
                                        .logicalDelete(context
                                            .read<FinanceListCubit>()
                                            .getID(index))
                                        .then(
                                          (value) => context
                                              .read<FinanceListCubit>()
                                              .getFinanceList(),
                                        );
                                  },
                                  icon: Icon(Icons.visibility_off),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child:
                                      Text('${state.operationNameList[index]}'),
                                ),
                              ]);
                        });
                  })),
        ),
      ],
    );
  }

  void getFinance() async {
    context.read<FinanceListCubit>().getFinanceList();
  }

  void UPDFinance(int index) async {
    context
        .read<FinanceParametrsCubit>()
        .updateFinanceParametrs(Financedata(
            id: context.read<FinanceParametrsCubit>().state.id,
            operationName: _operationNameController.text,
            description: _descriptionController.text,
            operationDate: _operationDate.text,
            operationTotal: double.parse(_operationTotal.text),
            isDeleted: false,
            idCategory: context
                .read<FinanceParametrsCubit>()
                .getIDCategoryFromName(dropdownValue)))
        .then((value) => context
            .read<FinanceListCubit>()
            .updateFinanceList(index, _operationNameController.text));
            SnackBar(
          content: Text('Успешное обновление финансовой отчетности'),
        );
  }

  void ADDFinance() async {
    context
        .read<FinanceParametrsCubit>()
        .addFinance(Financedata(
            id: 0,
            operationName: _operationNameController.text,
            description: _descriptionController.text,
            operationDate: _operationDate.text,
            operationTotal: double.parse(_operationTotal.text),
            isDeleted: false,
            idCategory: context
                .read<FinanceParametrsCubit>()
                .getIDCategoryFromName(dropdownValue)))
        .then((value) => context.read<FinanceListCubit>().getFinanceList());
        SnackBar(
          content: Text('Успешное добавление финансовой отчетности'),
        );
  }

  void showUpdateScreen(int index) async {
    // await context.read<ListCubit>().getID(index);
    int id = await context.read<FinanceListCubit>().getID(index);
    await context
        .read<FinanceParametrsCubit>()
        .getFinanceParametrs(id)
        .then((value) => context.read<FinanceParametrsCubit>().getCategories());
    _operationNameController.text =
        context.read<FinanceParametrsCubit>().state.operationName;
    _descriptionController.text =
        context.read<FinanceParametrsCubit>().state.description;
    _operationDate.text =
        context.read<FinanceParametrsCubit>().state.operationDate.toString();
    _operationTotal.text =
        context.read<FinanceParametrsCubit>().state.operationTotal.toString();
    _changeGrade(context.read<FinanceParametrsCubit>().getCategoryFromID(
        context.read<FinanceParametrsCubit>().state.idCategory));
    categoryList = context.read<FinanceParametrsCubit>().state.categotyNameList;
    screenTitle = 'Просмотр-Редактирование';
    showDialog(
      context: context,
      builder: (context) => gradeDialog(index),
    );
  }

  void showAddScreen() async {
    _operationNameController.text ='';
    _descriptionController.text ='';
    _operationDate.text ='';
    _operationTotal.text ='';
    await context.read<FinanceParametrsCubit>().getCategories();
    categoryList = context.read<FinanceParametrsCubit>().state.categotyNameList;
    _changeGrade('Ипотека');
    screenTitle = 'Добавление';
                showDialog(
      context: context,
      builder: (context) => gradeDialog(-1),
    );
  }

  void _changeGrade(_newGrade) {
    setState(
      () {
        dropdownValue = _newGrade;
      },
    );
  }

  StatefulBuilder gradeDialog(int index) {
    return StatefulBuilder(
      builder: (context, _setter) {
        return SimpleDialog(
          children: [
            const Spacer(),
            const Text(
              'Финансы',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26),
            ),
            const Spacer(),
            TextFormField(
              controller: _operationNameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Поле названия оперции пустое';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Наименование операции',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _descriptionController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Поле описания пустое';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Описание',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _operationTotal,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Поле суммы операции пустое';
                }
                return null;
              },
              obscureText: isObscure,
              decoration: InputDecoration(
                hintText: 'Сумма',
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
              controller: _operationDate,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Поле даты пустое';
                }
                return null;
              },
              obscureText: isObscure,
              decoration: InputDecoration(
                hintText: 'Дата',
                suffixIcon: TextFieldObscure(isObscure: (value) {
                  setState(() {
                    isObscure = value;
                  });
                }),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(dropdownValue ?? "Unknown"),
            const SizedBox(height: 30),
            DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String? _newGrade) {
                _setter(
                  () {
                    dropdownValue = _newGrade!;
                  },
                );
                _changeGrade(_newGrade);
              },
              items: categoryList.map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
            const SizedBox(height: 20),
            CustomButton(
                content: 'Сохранить',
                onPressed: () {
                  if(index != -1)
                    UPDFinance(index);
                  else
                    ADDFinance();
                  Navigator.pop(context);
                }),
          ],
        );
      },
    );
  }
}
