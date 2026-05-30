import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpComingBooking extends StatelessWidget {
  const UpComingBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.withValues(alpha: 0.15),
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Upcoming Bookings',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1A1A1A),
            ),
          ),

          const SizedBox(height: 8),

          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            tileColor: const Color(0xFFF8F8F8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            leading: const CircleAvatar(
              backgroundColor: Color(0xFFEEEDFE),
              child: Text('S', style: TextStyle(color: Color(0xFF534AB7))),
            ),
            title: Text(
              'Salman Ahmed',
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
            ),
            subtitle: const Text(
              'Haircut + Shave • 10:00 AM',
              style: TextStyle(fontSize: 11, color: Colors.grey),
            ),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFEAF3DE),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Confirmed',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF3B6D11),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            tileColor: const Color(0xFFF8F8F8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            leading: const CircleAvatar(
              backgroundColor: Color(0xFFEEEDFE),
              child: Text('S', style: TextStyle(color: Color(0xFF534AB7))),
            ),
            title: Text(
              'Salman Ahmed',
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
            ),
            subtitle: const Text(
              'Haircut + Shave • 10:00 AM',
              style: TextStyle(fontSize: 11, color: Colors.grey),
            ),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFEAF3DE),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Confirmed',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF3B6D11),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
