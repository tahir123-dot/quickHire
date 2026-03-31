import 'package:flutter/material.dart';

class AddCampaignScreen extends StatefulWidget {
  const AddCampaignScreen({super.key});

  @override
  State<AddCampaignScreen> createState() => _AddCampaignScreenState();
}

class _AddCampaignScreenState extends State<AddCampaignScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('add campaign screen'),
      ),
    );
  }
}
