import 'package:expense_131/constants/app_constants.dart';
import 'package:expense_131/models/filtered_expense_model.dart';
import 'package:expense_131/screens/add_trans/add_transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/expense_bloc.dart';
import '../../models/expense_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FilteredExpenseModel> arrDateWiseExpenses = [];

  @override
  void initState() {
    super.initState();
    context.read<ExpenseBloc>().add(FetchAllExpenseEvent());
  }


  //month wise
  //year wise
  //cat wise

  //week wise


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ExpenseBloc, ExpenseState>(
        builder: (_, state) {
          if (state is ExpenseLoaded) {
            filterExpensesByDate(state.listExpenses);

            return ListView.builder(
                itemCount: arrDateWiseExpenses.length,
                itemBuilder: (_, index) {
                  var currItem = arrDateWiseExpenses[index];
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${currItem.dateName}'),
                          Text('${currItem.totalAmt}')
                        ],
                      ),

                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: currItem.arrExpenses.length,
                        itemBuilder: (_, childIndex){

                          var currExp = currItem.arrExpenses[childIndex];
                          var imgPath = "";
                          imgPath = AppConstants.categories.firstWhere((element) =>
                          element['id'] == currExp.expe_cat_id)['img'];


                          return ListTile(
                            leading: Image.asset(imgPath),
                            title: Text(currExp.exp_title),
                            subtitle: Text(currExp.exp_desc),
                            trailing: Text('${currExp.exp_amt}'),
                          );
                        },
                      )
                    ],
                  );
                });
          } else if (state is ExpenseLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddTransactionPage(),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void filterExpensesByDate(List<ExpenseModel> arrExpenses) {
    arrDateWiseExpenses.clear();
    List<String> arrUniqueDates = [];

    /// step 1 (for unique dates)
    for (ExpenseModel eachExp in arrExpenses) {
      var eachDate = DateTime.parse(eachExp.exp_time);

      ///2023-09-06

      var mDate = "${eachDate.year}"
          "-${eachDate.month.toString().length < 2 ? "0${eachDate.month}" : "${eachDate.month}"}"
          "-${eachDate.day.toString().length < 2 ? "0${eachDate.day}" : "${eachDate.day}"}";

      if (!arrUniqueDates.contains(mDate)) {
        arrUniqueDates.add(mDate);
      }
    }

    print(arrUniqueDates);

    /// step 2 (unique dates expenses)
    for (String eachUniqueDate in arrUniqueDates) {
      List<ExpenseModel> eachDateExpenses = [];
      num eachDateAmt = 0;

      for (ExpenseModel eachExp in arrExpenses) {
        if (eachExp.exp_time.contains(eachUniqueDate)) {
          eachDateExpenses.add(eachExp);

          if (eachExp.exp_type == 0) {
            //debit
            eachDateAmt -= eachExp.exp_amt;
          } else {
            //credit
            eachDateAmt += eachExp.exp_amt;
          }
        }
      }
      print(eachDateAmt);

      arrDateWiseExpenses.add(FilteredExpenseModel(
          dateName: eachUniqueDate,
          totalAmt: eachDateAmt,
          arrExpenses: eachDateExpenses));
    }

    /// step 3
    print(arrDateWiseExpenses.length);
  }
}


//                   /*for(Map<String,dynamic> cat in AppConstants.categories){
//                   if(cat['id']==currItem.expe_cat_id){
//                     imgPath = cat['img'];
//                     break;
//                   }
//                 }*/
