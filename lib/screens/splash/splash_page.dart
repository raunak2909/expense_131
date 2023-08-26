
import 'package:flutter/material.dart';

import '../../utils/image_constants.dart';
import '../../utils/my_styles.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var mWidth = mediaQueryData.size.width;
    var mHeight = mediaQueryData.size.height;

    print("width: $mWidth, height: $mHeight");

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: mWidth*0.05,
              child: Image.asset(ImageConstants.appLogoIcon, color: Colors.grey.shade100, width: mediaQueryData.size.width*0.048, height: mediaQueryData.size.width*0.048,),
            ),

            Text('Expenser', style: mWidth>800 ? mTextStyle34(mWeight: FontWeight.bold) : mTextStyle25(mWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
