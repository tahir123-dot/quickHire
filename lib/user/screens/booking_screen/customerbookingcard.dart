import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mobile/utils/time_formatter.dart';
import 'package:mobile/user/data/model/customer_booking_model.dart';

class CustomerBookingCard extends StatelessWidget {
  final CustomerBookingModel booking;
  final VoidCallback? onCancel;

  const CustomerBookingCard({super.key, required this.booking, this.onCancel});

  Color get _statusColor => switch (booking.status.toLowerCase()) {
    'confirmed' => const Color(0xFF534AB7),
    'pending' => const Color(0xFF854F0B),
    'cancelled' => const Color(0xFFA32D2D),
    'done' => const Color(0xFF1A1A1A),
    _ => Colors.grey,
  };

  Color get _statusBg => switch (booking.status.toLowerCase()) {
    'confirmed' => const Color(0xFFEEEDFE),
    'pending' => const Color(0xFFFAEEDA),
    'cancelled' => const Color(0xFFFCEBEB),
    'done' => Colors.grey.shade200,
    _ => Colors.grey.shade100,
  };

  // Cancel button sirf tab dikhe jab booking abhi 'pending' ya 'confirmed' ho
  bool get _canCancel =>
      booking.status.toLowerCase() == 'pending' ||
      booking.status.toLowerCase() == 'confirmed';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(14.r),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22.r,
                  backgroundColor: const Color(0xFFEEEDFE),
                  child: Text(
                    booking.serviceProvider.name.isNotEmpty
                        ? booking.serviceProvider.name[0].toUpperCase()
                        : '?',
                    style: TextStyle(
                      color: const Color(0xFF534AB7),
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        booking.serviceProvider.name,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (booking.serviceProvider.phone != null) ...[
                        SizedBox(height: 3.h),
                        Row(
                          children: [
                            const Icon(
                              Icons.phone_outlined,
                              size: 12,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              booking.serviceProvider.phone!,
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                    color: _statusBg,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    booking.status,
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      color: _statusColor,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Divider(height: 1, color: Colors.grey.withValues(alpha: 0.12)),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  size: 16.sp,
                  color: Colors.grey,
                ),
                SizedBox(width: 6.w),
                Text(
                  DateFormat.MMMd().format(booking.bookingDate),
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 16.w),
                Icon(
                  Icons.watch_later_outlined,
                  size: 16.sp,
                  color: Colors.grey,
                ),
                SizedBox(width: 6.w),
                Text(
                  TimeFormatter.to12Hour(booking.startTime),
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  "Rs. ${booking.totalAmount.toStringAsFixed(0)}",
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF534AB7),
                  ),
                ),
              ],
            ),
          ),

          Divider(height: 1, color: Colors.grey.withValues(alpha: 0.12)),

          Padding(
            padding: EdgeInsets.all(14.r),
            child: Wrap(
              spacing: 6,
              runSpacing: 6,
              children: booking.services.map((s) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F4FF),
                    border: Border.all(
                      color: const Color(0xFF534AB7).withValues(alpha: 0.2),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    s.name,
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: const Color(0xFF534AB7),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          // ── Cancel Button — sirf pending/confirmed ke liye ──
          if (_canCancel) ...[
            Divider(height: 1, color: Colors.grey.withValues(alpha: 0.12)),
            Padding(
              padding: EdgeInsets.all(12.r),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: onCancel,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Color(0xFFF09595),
                      width: 1.2,
                    ),
                    foregroundColor: const Color(0xFFA32D2D),
                    padding: EdgeInsets.symmetric(vertical: 11.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    'Cancel Booking',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
