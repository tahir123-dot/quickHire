import 'package:flutter/material.dart';

class BoostProfileScreen extends StatefulWidget {
  const BoostProfileScreen({super.key});

  @override
  State<BoostProfileScreen> createState() => _BoostProfileScreenState();
}

class _BoostProfileScreenState extends State<BoostProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Boost Profile Screen'),
      ),
    );
  }
}
