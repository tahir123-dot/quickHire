import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/themes/app_text_theme.dart';
import 'package:mobile/routes/shared_routes/public_routes_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    startSplash();
  }

  void startSplash() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    context.go(PublicRoutesConstants.accountTypeScreen);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFFEBF7FE), elevation: 0),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/quickhire.webp', fit: BoxFit.contain),

              SizedBox(height: 50.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 36.w),
                child: Text(
                  'QuickHire helps you find and book verified electricians, plumbers, barbers, and more all in one place.',
                  style: AppTextTheme.paragraph,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
