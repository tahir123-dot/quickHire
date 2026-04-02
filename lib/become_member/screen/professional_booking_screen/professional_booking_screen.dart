import 'package:flutter/material.dart';

class ProfessionalBookingScreen extends StatefulWidget {
  const ProfessionalBookingScreen({super.key});

  @override
  State<ProfessionalBookingScreen> createState() =>
      _ProfessionalBookingScreenState();
}

class _ProfessionalBookingScreenState extends State<ProfessionalBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(child: Text('Professional Booking Screen'))),
    );
  }
}
