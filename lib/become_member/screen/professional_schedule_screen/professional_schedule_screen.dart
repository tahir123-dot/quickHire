import 'package:flutter/material.dart';

class ProfessionalScheduleScreen extends StatefulWidget {
  const ProfessionalScheduleScreen({super.key});

  @override
  State<ProfessionalScheduleScreen> createState() =>
      _ProfessionalScheduleScreenState();
}

class _ProfessionalScheduleScreenState
    extends State<ProfessionalScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text('Professional Schedule Screen')),
      ),
    );
  }
}
