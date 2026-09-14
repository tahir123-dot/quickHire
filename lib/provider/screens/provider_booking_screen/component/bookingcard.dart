import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mobile/provider/data/model/provider_booking_model.dart';
import 'package:mobile/utils/time_formatter.dart';

class BookingCardR extends StatelessWidget {
  final ProviderBookingModel booking;
  final VoidCallback? onAccept;
  final VoidCallback? onDecline;
  final VoidCallback? onMarkDone;

  const BookingCardR({
    super.key,
    required this.booking,
    this.onAccept,
    this.onDecline,
    this.onMarkDone,
  });

  Color get _statusColor => switch (booking.status.toLowerCase()) {
    'confirmed' => const Color.fromARGB(255, 247, 247, 247),
    'pending' => const Color(0xFF854F0B),
    'cancelled' => const Color.fromARGB(255, 32, 32, 32),
    'done' => const Color(0xFF534AB7),
    _ => Colors.grey,
  };

  Color get _statusBg => switch (booking.status.toLowerCase()) {
    'confirmed' => const Color(0xFF534AB7),
    'pending' => const Color(0xFFFAEEDA),
    'cancelled' => const Color(0xFFFCEBEB),
    'done' => const Color(0xFFEEEDFE),
    _ => Colors.grey.shade100,
  };

  String get _totalServicesLabel => booking.services.length == 1
      ? '1 service'
      : '${booking.services.length} services';

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
          // ── Top: Avatar + Name + Status ──
          Padding(
            padding: EdgeInsets.all(14.r),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22.r,
                  backgroundColor: const Color(0xFFEEEDFE),
                  child: Text(
                    booking.customer.name.isNotEmpty
                        ? booking.customer.name[0].toUpperCase()
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
                        booking.customer.name,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1A1A1A),
                        ),
                      ),
                      if (booking.customer.phone != null) ...[
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
                              booking.customer.phone!,
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

          _divider(),

          // ── Date | Time | Total ──
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  _infoCell(
                    label: 'Date',
                    main: DateFormat.MMMd().format(booking.bookingDate),
                    sub: DateFormat.E().format(booking.bookingDate),
                  ),
                  _verticalDivider(),
                  _infoCell(
                    label: 'Time',
                    main: TimeFormatter.to12Hour(booking.startTime),
                    sub: '${booking.totalDuration} min',
                  ),
                  _verticalDivider(),
                  _infoCell(
                    label: 'Total',
                    main: 'Rs ${booking.totalAmount.toStringAsFixed(0)}',
                    sub: _totalServicesLabel,
                    mainColor: const Color(0xFF534AB7),
                  ),
                ],
              ),
            ),
          ),

          _divider(),

          // ── Services + Team ──
          Padding(
            padding: EdgeInsets.all(14.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.content_cut, size: 15, color: Colors.grey),
                    SizedBox(width: 8.w),
                    Expanded(
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
                                color: const Color(
                                  0xFF534AB7,
                                ).withValues(alpha: 0.2),
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
                  ],
                ),

                // Team member — sirf tab dikhta hai jab assigned ho
                if (booking.teamMemberId != null) ...[
                  SizedBox(height: 10.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F8F8),
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: Colors.grey.withValues(alpha: 0.12),
                      ),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 15.r,
                          backgroundColor: const Color(0xFFEEEDFE),
                          child: Text(
                            (booking.teamMemberName ?? '?').isNotEmpty
                                ? (booking.teamMemberName ?? '?')[0]
                                      .toUpperCase()
                                : '?',
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: const Color(0xFF534AB7),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Team Member',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              booking.teamMemberName ?? 'Assigned',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF1A1A1A),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.all(6.r),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEEEDFE),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: const Icon(
                            Icons.manage_accounts_outlined,
                            color: Color(0xFF534AB7),
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),

          _divider(),

          // ── Action Buttons — status ke hisab se ──
          if (booking.status.toLowerCase() == 'pending')
            Padding(
              padding: EdgeInsets.all(12.r),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onDecline,
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
                        'Decline',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onAccept,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF534AB7),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: EdgeInsets.symmetric(vertical: 11.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: Text(
                        'Accept',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          else if (booking.status.toLowerCase() == 'confirmed')
            Padding(
              padding: EdgeInsets.all(12.r),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onMarkDone,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF534AB7),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(vertical: 11.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Text(
                    'Mark as Done',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _divider() =>
      Divider(height: 1, color: Colors.grey.withValues(alpha: 0.12));

  Widget _verticalDivider() =>
      VerticalDivider(color: Colors.grey.withValues(alpha: 0.2), width: 24);

  Widget _infoCell({
    required String label,
    required String main,
    required String sub,
    Color mainColor = const Color(0xFF1A1A1A),
  }) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 10.sp, color: Colors.grey),
          ),
          const SizedBox(height: 4),
          Text(
            main,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: mainColor,
            ),
          ),
          Text(
            sub,
            style: TextStyle(fontSize: 10.sp, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
