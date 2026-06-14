import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/provider/screens/provider_booking_screen/component/bookingcard.dart';
import '../../../core/themes/colors.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: const TopBarMinimal(pageName: 'Activity'),
      ),

      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          children: [
            const SizedBox(height: 19),
            BookingCardR(
              url: '',
              name: 'Salman Ahmed',
              location: 'Gulberg, Lahore',
              dateAndday: 'Fri, 30 May 2025 Friday',
              time: '10:00 AM',
              duration: '45 min',
              price: 800,
              totalServices: 2,
              services: ['Haircut', 'Shave'],
              teamUrl: '',
              teamName: 'Raza Bhai',
              status: 'Confirmed',
            ),
            const SizedBox(height: 19),
            BookingCardR(
              url: '',
              name: 'Salman Ahmed',
              location: 'Gulberg, Lahore',
              dateAndday: 'Fri, 30 May 2025 Friday',
              time: '10:00 AM',
              duration: '45 min',
              price: 800,
              totalServices: 2,
              services: ['Haircut', 'Shave'],
              teamUrl: '',
              teamName: 'Raza Bhai',
              status: 'Confirmed',
            ),
            const SizedBox(height: 19),
            BookingCardR(
              url: '',
              name: 'Salman Ahmed',
              location: 'Gulberg, Lahore',
              dateAndday: 'Fri, 30 May 2025 Friday',
              time: '10:00 AM',
              duration: '45 min',
              price: 800,
              totalServices: 2,
              services: ['Haircut', 'Shave'],
              teamUrl: '',
              teamName: 'Raza Bhai',
              status: 'Confirmed',
            ),
            const SizedBox(height: 19),
            BookingCardR(
              url: '',
              name: 'Salman Ahmed',
              location: 'Gulberg, Lahore',
              dateAndday: 'Fri, 30 May 2025 Friday',
              time: '10:00 AM',
              duration: '45 min',
              price: 800,
              totalServices: 2,
              services: ['Haircut', 'Shave'],
              teamUrl: '',
              teamName: 'Raza Bhai',
              status: 'Confirmed',
            ),
          ],
        ),
      ),
    );
  }
}
