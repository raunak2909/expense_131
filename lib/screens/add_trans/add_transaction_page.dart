import 'package:expense_131/app_widgets/app_rounded_button.dart';
import 'package:expense_131/bloc/expense_bloc.dart';
import 'package:expense_131/constants/app_constants.dart';
import 'package:expense_131/models/expense_model.dart';
import 'package:expense_131/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  var titleController = TextEditingController();
  var descController = TextEditingController();
  var amtController = TextEditingController();
  var selectedCatIndex = -1;

  var listCatType = ['Debit', 'Credit'];
  var selectedTransType = 'Debit';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            children: [
              TextField(
                  controller: titleController,
                  decoration: myDecoration(
                      mLabel: "Title", mHint: "Enter title here..")),
              hSpacer(),
              TextField(
                  controller: descController,
                  decoration:
                      myDecoration(mLabel: "Desc", mHint: "Enter Desc here..")),
              hSpacer(),
              TextField(
                  controller: amtController,
                  decoration: myDecoration(
                      mLabel: "Amount", mHint: "Enter Amount here..")),
              hSpacer(),
              AppRoundedButton(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: EdgeInsets.all(11),
                          height: 300,
                          child: GridView.builder(
                              itemCount: AppConstants.categories.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4),
                              itemBuilder: (_, index) {
                                return InkWell(
                                  onTap: () {
                                    selectedCatIndex = index;
                                    setState(() {});
                                    Navigator.pop(context);
                                  },
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          AppConstants.categories[index]['img'],
                                          width: 50,
                                          height: 50,
                                        ),
                                      ),
                                      Text(
                                        AppConstants.categories[index]['name'],
                                      )
                                    ],
                                  ),
                                );
                              }),
                        );
                      });
                },
                title: "Choose Category",
                mWidget: selectedCatIndex >= 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppConstants.categories[selectedCatIndex]['img'],
                            width: 30,
                            height: 30,
                          ),
                          Text(" - ",
                              style: mTextStyle16(fontColor: Colors.white)),
                          Text(
                              AppConstants.categories[selectedCatIndex]['name'],
                              style: mTextStyle16(fontColor: Colors.white))
                        ],
                      )
                    : null,
              ),
              hSpacer(),
              DropdownButton(
                  value: selectedTransType,
                  items: listCatType
                      .map((element) => DropdownMenuItem(
                            child: Text(element),
                            value: element,
                          ))
                      .toList(),
                  onChanged: (value) {
                    selectedTransType = value!;
                    setState(() {});
                  }),
              hSpacer(),
              AppRoundedButton(
                  onTap: () {
                    context.read<ExpenseBloc>().add(AddExpenseEvent(
                        newExpense: ExpenseModel(
                            u_id: 1,
                            exp_title: titleController.text.toString(),
                            exp_desc: descController.text.toString(),
                            exp_amt: double.parse(amtController.text.toString()),
                            exp_bal: 0,
                            exp_type: selectedTransType=="Debit" ? 0 : 1,
                            expe_cat_id: AppConstants.categories[selectedCatIndex]['id'],
                            exp_time: DateTime.now().toString())));

                    Navigator.pop(context);
                  },
                  title: 'Add Transaction')
            ],
          ),
        ),
      ),
    );
  }
}
