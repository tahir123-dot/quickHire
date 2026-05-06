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
    DateTime today = DateTime.now();
    return Scaffold(
      appBar: AppBar(title: const Text('Availability')),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Date & Time',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
