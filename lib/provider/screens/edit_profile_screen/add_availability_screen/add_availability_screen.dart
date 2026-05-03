import 'package:flutter/material.dart';
import '../../../../components/availability_component/availability_component.dart';

class AddAvailabilityScreen extends StatelessWidget {
  const AddAvailabilityScreen({super.key});

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
                'Availablity screen',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ),
              AvailabilityComponent(
                focusedDay: today,
                onDaySelected: (selectedDay, focusedDay) {
                  // yahan future me state handle kar sakte ho
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
