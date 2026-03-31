import 'package:flutter/material.dart';

class ProviderBookingScreen extends StatefulWidget {
  const ProviderBookingScreen({super.key});

  @override
  State<ProviderBookingScreen> createState() => _ProviderBookingScreenState();
}

class _ProviderBookingScreenState extends State<ProviderBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Provider Booking Screen'),
      ),
    );
  }
}
