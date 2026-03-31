import 'package:flutter/material.dart';

class AdsPlanScreen extends StatefulWidget {
  const AdsPlanScreen({super.key});

  @override
  State<AdsPlanScreen> createState() => _AdsPlanScreenState();
}

class _AdsPlanScreenState extends State<AdsPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('ads plan screen'),
      ),
    );
  }
}
