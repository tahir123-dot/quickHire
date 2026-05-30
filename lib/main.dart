import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/routes/app_routes.dart';
import 'package:mobile/shared/bloc/blocimpl/authbloc.dart';
import 'package:mobile/shared/bloc/event/auth_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "assets/.env");

  setup(); // GetIt init

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => getIt<AuthBloc>()..add(CheckAuthEvent()),

      child: ScreenUtilInit(
        designSize: const Size(402, 874),
        minTextAdapt: true,
        splitScreenMode: true,

        builder: (context, child) {
          final appRoutes = AppRoutes(authBloc: context.read<AuthBloc>());

          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: appRoutes.router,
            theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          );
        },
      ),
    );
  }
}
