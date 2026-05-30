import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/themes/app_text_theme.dart';
import 'package:mobile/routes/shared_routes/public_routes_constants.dart';
import 'package:mobile/shared/bloc/blocimpl/authbloc.dart';
import 'package:mobile/shared/bloc/event/auth_event.dart';
import 'package:mobile/shared/bloc/state/auth_state.dart';
import 'package:mobile/utils/home.route.dart';

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

  void startSplash() {
    _timer = Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      context.read<AuthBloc>().add(CheckAuthEvent());
    });
  }

  void _navigate(AuthState state) {
    if (!mounted) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state is Authenticated) {
        context.go(getHomeRoute(state.role));
      } else {
        context.go(PublicRoutesConstants.accountTypeScreen);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated || state is Unauthenticated) {
          _navigate(state);
        }
      },
      child: Scaffold(
        appBar: AppBar(backgroundColor: const Color(0xFFEBF7FE), elevation: 0),
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/quickhire.webp',
                  fit: BoxFit.contain,
                ),

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
      ),
    );
  }
}
