import 'package:flutter/material.dart';

class ServiceProviderTeamScreen extends StatefulWidget {
  const ServiceProviderTeamScreen({super.key});

  @override
  State<ServiceProviderTeamScreen> createState() => _ServiceProviderTeamScreenState();
}

class _ServiceProviderTeamScreenState extends State<ServiceProviderTeamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Service Provider Team Screen see by users'),
      ),
    );
  }
}
