import 'package:expense_131/constants/app_constants.dart';
import 'package:expense_131/screens/add_trans/add_transaction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/expense_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ExpenseBloc>().add(FetchAllExpenseEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ExpenseBloc, ExpenseState>(
        builder: (_, state) {
          if (state is ExpenseLoaded) {
            return ListView.builder(
                itemCount: state.listExpenses.length,
                itemBuilder: (_, index) {
                  var currItem = state.listExpenses[index];
                  var imgPath = "";
                  imgPath = AppConstants.categories.firstWhere((element) =>
                      element['id'] == currItem.expe_cat_id)['img'];

                  /*for(Map<String,dynamic> cat in AppConstants.categories){
                  if(cat['id']==currItem.expe_cat_id){
                    imgPath = cat['img'];
                    break;
                  }
                }*/
                  return ListTile(
                    leading: Image.asset(imgPath),
                    title: Text(currItem.exp_title),
                    subtitle: Text(currItem.exp_desc),
                    trailing: Text('\$${currItem.exp_amt}'),
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
}
