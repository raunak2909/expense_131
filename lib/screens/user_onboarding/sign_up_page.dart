import 'package:expense_131/app_widgets/app_rounded_button.dart';
import 'package:expense_131/models/user_model.dart';
import 'package:expense_131/screens/user_onboarding/bloc/user_bloc.dart';
import 'package:expense_131/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var emailController = TextEditingController();
  var mobNoController = TextEditingController();
  var passController = TextEditingController();
  var genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'Sign Up',
            style: mTextStyle43(),
          ),
          hSpacer(),
          TextField(
            controller: emailController,
            decoration:
                myDecoration(mLabel: "Email", mHint: "Enter you email here.."),
          ),
          hSpacer(),
          TextField(
            controller: mobNoController,
            decoration: myDecoration(
                mLabel: "Mobile", mHint: "Enter you Mobile no here.."),
          ),
          hSpacer(),
          TextField(
            controller: genderController,
            decoration: myDecoration(
                mLabel: "Gender", mHint: "Enter you Gender here.."),
          ),
          hSpacer(),
          TextField(
            controller: passController,
            decoration: myDecoration(
                mLabel: "Password", mHint: "Enter you pass here.."),
          ),
          hSpacer(),
          BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if (state is UserSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('User Account created!!')));
                Navigator.pop(context);
              } else if (state is UserFailState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.failMsg)));
              }
            },
            builder: (context, state){

              if(state is UserLoadingState){
                return Center(child: CircularProgressIndicator(),);
              }

              return AppRoundedButton(
                  onTap: () {
                    var email = emailController.text.toString();
                    var mobno = mobNoController.text.toString();
                    var pass = passController.text.toString();
                    var gender = genderController.text.toString();

                    context.read<UserBloc>().add(CreateNewUserEvent(
                        newUser: UserModel(
                            email: email,
                            mobno: mobno,
                            pass: pass,
                            gender: gender)));
                  },
                  title: 'Create Account');
            },

          )
        ],
      ),
    );
  }
}
