import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/size_config/size_config.dart';
import 'package:mobile/core/themes/app_text_theme.dart';
import 'package:mobile/routes/shared_routes/shared_routes_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  @override
  void initState() {
    super.initState();

    /*SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);*/

    startSplash();
  }

  void startSplash() {
    Timer(const Duration(seconds: 1), () {
      context.go(SharedRoutesConstant.signupScreen);
    });
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    //print("Screen width: ${SizeConfig.width}");
    //print("Screen height: ${SizeConfig.height}");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: SizeConfig.blockWidth*6.0, horizontal: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/quickhire.png',fit: BoxFit.contain,),
            const SizedBox(height: 50),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockWidth*10.0),
                child: Text(
                  'QuickHire helps you find and book verified electricians, plumbers, barbers, and more all in one place.',
                  style: AppTextTheme.paragraph,
                  textAlign: TextAlign.start,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}