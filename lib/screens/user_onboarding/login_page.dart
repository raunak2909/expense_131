import 'package:expense_131/app_widgets/app_rounded_button.dart';
import 'package:expense_131/constants/color_constant.dart';
import 'package:flutter/material.dart';

import '../../utils/image_constants.dart';
import '../../utils/my_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var mWidth = mediaQueryData.size.width;
    var mHeight = mediaQueryData.size.height;
    print("MQWidth: $mWidth, MQHeight: $mHeight");
    var mOrientation = mediaQueryData.orientation;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: mOrientation == Orientation.portrait
            ? portraitUI(mWidth, mWidth)
            : landScapeUI(mWidth, mHeight),
      ),
    );
  }

  Widget mainUI(double mWidth, double mHeight) {
    return mHeight > 334
        ? mainSubUI(mWidth, mHeight)
        : SingleChildScrollView(
            child: mainSubUI(mWidth, mHeight),
          );
  }

  Widget mainSubUI(double mWidth, double mHeight){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: mWidth * 0.08,
          child: Image.asset(
            ImageConstants.appLogoIcon,
            color: Colors.grey.shade100,
            width: mWidth * 0.075,
            height: mWidth * 0.075,
          ),
        ),
        hSpacer(mHeight: 16),
        SizedBox(
          width: mWidth * 0.4,
          child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
              child: Text(
                'Welcome, Back!!',
                style: mTextStyle34(mWeight: FontWeight.bold),
              )),
        ),
        hSpacer(),
        TextField(
            decoration: myDecoration(
                mPrefixIcon: Icons.email_outlined,
                mLabel: "Email",
                mHint: "Enter your Email..")),
        hSpacer(),
        TextField(
            obscuringCharacter: "*",
            obscureText: true,
            decoration: myDecoration(
                mPrefixIcon: Icons.password,
                mLabel: "Password",
                mHint: "Enter your Email..")),
        hSpacer(mHeight: 16),
        AppRoundedButton(onTap: () {}, title: "Login")
      ],
    );
  }

  Widget portraitUI(double mWidth, double mHeight) {
    return mainUI(mWidth, mHeight);
  }

  Widget landScapeUI(double mWidth, double mHeight) {
    return Row(
      children: [
        Expanded(
          flex: 1,
            child: Container(
          child: Center(
            child: CircleAvatar(
              backgroundColor: Colors.black,
              radius: mHeight * 0.1,
              child: Image.asset(
                ImageConstants.appLogoIcon,
                color: Colors.grey.shade100,
                width: mHeight * 0.09,
                height: mHeight * 0.09,
              ),
            ),
          ),
        )),
        Expanded(flex: 2, child: LayoutBuilder(builder: (context, constraints) {
          var mWidth = constraints.maxWidth;
          var mHeight = constraints.maxHeight;
          print("LBWidth: $mWidth, LBHeight: $mHeight");
          return mainUI(constraints.maxWidth, mHeight);
        }))
      ],
    );
  }
}

///another responsive ui
/*Widget mainUI(double mWidth, bool isLandscape){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircleAvatar(
        backgroundColor: Colors.black,
        radius: mWidth*0.08,
        child: Image.asset(ImageConstants.appLogoIcon, color: Colors.grey.shade100, width: mWidth*0.075, height: mWidth*0.075,),
      ),
      hSpacer(
          mHeight: 16
      ),
      Text('Welcome, Back!!', style: mTextStyle25(mWeight: FontWeight.bold),),
      hSpacer(),
      SizedBox(
        height: 200,
        width: double.infinity,
        child: isLandscape ? Row(
          children: [
            Expanded(
              child: TextField(
                  decoration: myDecoration(
                      mPrefixIcon: Icons.email_outlined,
                      mLabel: "Email", mHint: "Enter your Email..")
              ),
            ),
            wSpacer(),
            Expanded(
              child: TextField(
                  obscuringCharacter: "*",
                  obscureText: true,
                  decoration: myDecoration(
                      mPrefixIcon: Icons.password,
                      mLabel: "Password", mHint: "Enter your Email..")
              ),
            ),
          ],
        ) : Column(
          children: [
            TextField(
                decoration: myDecoration(
                    mPrefixIcon: Icons.email_outlined,
                    mLabel: "Email", mHint: "Enter your Email..")
            ),
            wSpacer(),
            TextField(
                obscuringCharacter: "*",
                obscureText: true,
                decoration: myDecoration(
                    mPrefixIcon: Icons.password,
                    mLabel: "Password", mHint: "Enter your Email..")
            ),
          ],
        ),
      ),
      hSpacer(
          mHeight: 16
      ),
      AppRoundedButton(onTap: (){}, title: "Login")
    ],
  );
}*/
