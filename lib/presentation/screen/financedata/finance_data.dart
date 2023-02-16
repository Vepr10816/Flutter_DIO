import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dio/state/cubit/financeparametrs_cubit.dart';

import '../../../financedata.dart';
import '../../../state/cubit/list_cubit.dart';
import '../../../state/cubit/list_state.dart';
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
  GlobalKey<FormState> _key = GlobalKey();

  TextEditingController _operationNameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _operationDate = TextEditingController();
  TextEditingController _operationTotal = TextEditingController();
  TextEditingController _isDeletedController = TextEditingController();
  TextEditingController _idCategoryController = TextEditingController();
  bool isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              setState(() {
                context.read<FinanceParametrsCubit>().logicalReturn().then((value) => context.read<ListCubit>().MyFinance());
              });
            },
            child: const Text("Логиеское восстановление")),
        ElevatedButton(
            onPressed: () {
              setState(() {
                showDialog(
                    context: context,
                    builder: ((context) => SimpleDialog(
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
                        )));
                //Navigator.pushNamedAndRemoveUntil(context, FinanceIDParametrs.routeName, (route) => false);
              });
            },
            child: const Text("Добавить")),
        /*ElevatedButton(
            onPressed: () {
              setState(() {
                context.read<ListCubit>().MyFinance();
                //Navigator.pushNamedAndRemoveUntil(context, FinanceIDParametrs.routeName, (route) => false);
              });
            },
            child: const Text("Обновить")),*/
        Expanded(
          child: SizedBox(
              height: 500.0,
              child: BlocConsumer<ListCubit, ListState>(
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
                                      context.read<ListCubit>().Delete(index);
                                    });
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      getIDFinance(index);
                                      //Navigator.pushNamedAndRemoveUntil(context, FinanceIDParametrs.routeName, (route) => false);
                                    });
                                    showDialog(
                                        context: context,
                                        builder: ((context) => SimpleDialog(
                                              children: [
                                                const Spacer(),
                                                const Text(
                                                  'Просмотр-Редактирование',
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      TextStyle(fontSize: 26),
                                                ),
                                                const Spacer(),
                                                TextFormField(
                                                  controller:
                                                      _operationNameController,
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Поле названия оперции пустое';
                                                    }
                                                    return null;
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText:
                                                        'Наименование операции',
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                ),
                                                const SizedBox(height: 20),
                                                TextFormField(
                                                  controller:
                                                      _descriptionController,
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Поле описания пустое';
                                                    }
                                                    return null;
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText: 'Описание',
                                                    border:
                                                        OutlineInputBorder(),
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
                                                        TextFieldObscure(
                                                            isObscure: (value) {
                                                      setState(() {
                                                        isObscure = value;
                                                      });
                                                    }),
                                                    border:
                                                        const OutlineInputBorder(),
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
                                                        TextFieldObscure(
                                                            isObscure: (value) {
                                                      setState(() {
                                                        isObscure = value;
                                                      });
                                                    }),
                                                    border:
                                                        const OutlineInputBorder(),
                                                  ),
                                                ),
                                                const SizedBox(height: 20),
                                                CustomButton(
                                                    content: 'Сохранить',
                                                    onPressed: () {
                                                      UPDFinance(index);
                                                    }),
                                                const Spacer(flex: 3),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: ElevatedButton(
                                                    onPressed: () =>
                                                        Navigator.pop(context),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      shape:
                                                          const CircleBorder(),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15),
                                                    ),
                                                    child: const Icon(
                                                        Icons.arrow_back,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            )));
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () {
                                    context.read<FinanceParametrsCubit>().logicalDelete(context.read<ListCubit>().getID(index))
                                        .then(
                                          (value) => context
                                              .read<ListCubit>()
                                              .MyFinance(),
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
    context.read<ListCubit>().MyFinance();
  }

  void UPDFinance(int index) async {
    context.read<FinanceParametrsCubit>().updateFinance(Financedata(
        id: context.read<FinanceParametrsCubit>().state.id,
        operationName: _operationNameController.text,
        description: _descriptionController.text,
        operationDate: _operationDate.text,
        operationTotal: double.parse(_operationTotal.text),
        isDeleted: false,
        idCategory: 1)).then((value) => context.read<ListCubit>().Update(index, _operationNameController.text));
  }

  void ADDFinance() async {
    context.read<FinanceParametrsCubit>().addFinance(Financedata(
        id: 0,
        operationName: _operationNameController.text,
        description: _descriptionController.text,
        operationDate: _operationDate.text,
        operationTotal: double.parse(_operationTotal.text),
        isDeleted: false,
        idCategory: 1)).then((value) => context.read<ListCubit>().MyFinance());
  }

  void getIDFinance(int index) async{
   // await context.read<ListCubit>().getID(index);
    await context.read<FinanceParametrsCubit>().GetFinance(await context.read<ListCubit>().getID(index));
    _operationNameController.text =
        await context.read<FinanceParametrsCubit>().state.operationName;
    _descriptionController.text =
        await context.read<FinanceParametrsCubit>().state.description;
    _operationDate.text =
        await context.read<FinanceParametrsCubit>().state.operationDate.toString();
    _operationTotal.text =
        await context.read<FinanceParametrsCubit>().state.operationTotal.toString();
  }
}
