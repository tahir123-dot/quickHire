import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/routes/app_routes.dart';

import 'package:mobile/shared/bloc/blocimpl/authbloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "assets/.env");

  setup(); // GetIt init

  /*final storage = getIt<IStorageService>();
  final token = await storage.getToken();

  if (token != null) {
    await AuthService.setToken(token);
  }*/

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<AuthBloc>(create: (_) => getIt<AuthBloc>())],

      // 🔥 ScreenUtil wrapper added here
      child: ScreenUtilInit(
        designSize: const Size(402, 874),
        minTextAdapt: true,
        splitScreenMode: true,

        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRoutes().router,
            theme: ThemeData(scaffoldBackgroundColor: Colors.white),
          ); /* MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(scaffoldBackgroundColor: Colors.white),
            home: AddressScreen(),
          );*/
        },
      ),
    );
  }
}
