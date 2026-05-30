import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/routes/user_routes/user_routes_constants.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child: Text('Page not Found not')),
          ElevatedButton(
            onPressed: () {
              context.go(UserRoutesConstants.home);
            },
            child: Text('Go To Home Page'),
          ),
        ],
      ),
    );
  }
}
