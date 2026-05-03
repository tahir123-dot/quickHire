import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/injection/injection_container.dart';

import 'package:mobile/core/size_config/size_config.dart';
import 'package:mobile/core/themes/app_text_theme.dart';
import 'package:mobile/routes/auth/auth_initializer.dart';
import 'package:mobile/routes/auth/auth_service.dart';
import 'package:mobile/routes/auth/route_helper.dart';

import 'package:mobile/routes/shared_routes/shared_routes_constant.dart';
import 'package:mobile/utils/storage.dart';

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

    final storage = getIt<IStorageService>();
    await AuthInitializer.init(storage);

    if (!mounted) return;

    if (!AuthService.isLoggedIn) {
      context.go(SharedRoutesConstant.signupScreen);
      return;
    }

    context.go(getHomeRoute(AuthService.role!));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFFEBF7FE), elevation: 0),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/quickhire.webp', fit: BoxFit.contain),

              const SizedBox(height: 50),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockWidth * 6.0,
                ),
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
