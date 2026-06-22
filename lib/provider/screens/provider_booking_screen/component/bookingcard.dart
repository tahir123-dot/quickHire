import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingCardR extends StatelessWidget {
  final String url;
  final String name;
  final String location;
  final String dateAndday;
  final String time;
  final String duration;
  final int price;
  final int totalServices;
  final List<String> services;
  final String teamUrl;
  final String teamName;
  final String status;

  const BookingCardR({
    super.key,
    required this.url,
    required this.name,
    required this.location,
    required this.dateAndday,
    required this.time,
    required this.duration,
    required this.price,
    required this.totalServices,
    required this.services,
    required this.teamUrl,
    required this.teamName,
    required this.status,
  });

  Color get _statusColor => switch (status.toLowerCase()) {
    'confirmed' => const Color.fromARGB(255, 247, 247, 247),
    'pending' => const Color(0xFF854F0B),
    'cancelled' => const Color.fromARGB(255, 32, 32, 32),
    'done' => const Color(0xFF534AB7),
    _ => Colors.grey,
  };

  Color get _statusBg => switch (status.toLowerCase()) {
    'confirmed' => const Color(0xFF534AB7),
    'pending' => const Color(0xFFFAEEDA),
    'cancelled' => const Color(0xFFFCEBEB),
    'done' => const Color(0xFFEEEDFE),
    _ => Colors.grey.shade100,
  };

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
          // ── Top: Avatar + Name + Location + Status ──
          Padding(
            padding: EdgeInsets.all(14.r),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22.r,
                  backgroundImage: url.isNotEmpty ? NetworkImage(url) : null,
                  backgroundColor: const Color(0xFFEEEDFE),
                  child: url.isEmpty
                      ? Text(
                          name[0],
                          style: TextStyle(
                            color: const Color(0xFF534AB7),
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                          ),
                        )
                      : null,
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1A1A1A),
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 12,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            location,
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
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
                    status,
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
                    main: dateAndday.split(' ').take(4).join(' '),
                    sub: dateAndday.split(' ').last,
                  ),
                  _verticalDivider(),
                  _infoCell(label: 'Time', main: time, sub: duration),
                  _verticalDivider(),
                  _infoCell(
                    label: 'Total',
                    main: 'Rs $price',
                    sub: '$totalServices service',
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
                // Services chips
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.content_cut, size: 15, color: Colors.grey),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: services
                            .map(
                              (s) => Container(
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
                                  s,
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: const Color(0xFF534AB7),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10.h),

                // Team member
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
                        backgroundImage: teamUrl.isNotEmpty
                            ? NetworkImage(teamUrl)
                            : null,
                        backgroundColor: const Color(0xFFEEEDFE),
                        child: teamUrl.isEmpty
                            ? Text(
                                teamName[0],
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  color: const Color(0xFF534AB7),
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            : null,
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
                            teamName,
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
            ),
          ),

          _divider(),

          // ── Action Buttons ──
          Padding(
            padding: EdgeInsets.all(12.r),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
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
                      'Cancel',
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
                    onPressed: () {},
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── Helpers ───

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
