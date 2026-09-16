import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          children: [
            TopBarWidget(),
            SizedBox(height: 16.h),
            const _EarningsCard(),
            SizedBox(height: 24.h),
            Text(
              "This week's bookings",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 4.h),
            Text(
              "Up 12% from last week",
              style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
            ),
            SizedBox(height: 12.h),
            const _WeeklyBarChart(),
            SizedBox(height: 24.h),
            Text(
              "Upcoming bookings",
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 12.h),
            const _BookingRow(
              initials: 'SR',
              name: 'Sara Raza',
              detail: 'Switchboard repair, F-10',
              time: '4:30 PM',
              status: 'Confirmed',
              isConfirmed: true,
            ),
            SizedBox(height: 10.h),
            const _BookingRow(
              initials: 'BA',
              name: 'Bilal Ahmed',
              detail: 'Wiring check, G-9 · tomorrow',
              time: '11:00 AM',
              status: 'Pending',
              isConfirmed: false,
            ),
            SizedBox(height: 10.h),
            const _BookingRow(
              initials: 'HM',
              name: 'Hina Malik',
              detail: 'Fan installation, E-11 · tomorrow',
              time: '3:00 PM',
              status: 'Confirmed',
              isConfirmed: true,
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}

// ─── Earnings hero card ───

class _EarningsCard extends StatelessWidget {
  const _EarningsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: const Color(0xFFEEEDFE), // purple-50
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today's earnings",
            style: TextStyle(fontSize: 13.sp, color: const Color(0xFF534AB7)),
          ),
          SizedBox(height: 6.h),
          Text(
            'Rs 60,000',
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF26215C),
            ),
          ),
          SizedBox(height: 14.h),
          Row(
            children: [
              _HeroStat(value: '6', label: 'Bookings'),
              SizedBox(width: 24.w),
              _HeroStat(value: '4.7 ★', label: '48 reviews'),
              SizedBox(width: 24.w),
              _HeroStat(value: '92%', label: 'Accept rate'),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroStat extends StatelessWidget {
  final String value;
  final String label;

  const _HeroStat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF26215C),
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          label,
          style: TextStyle(fontSize: 12.sp, color: const Color(0xFF534AB7)),
        ),
      ],
    );
  }
}

// ─── Weekly bar chart ───

class _WeeklyBarChart extends StatelessWidget {
  const _WeeklyBarChart();

  // Sun..Sat heights as a fraction of max height, highlighted day = Wed
  static const List<double> _heights = [
    0.26,
    0.48,
    1.0,
    0.38,
    0.60,
    0.45,
    0.20,
  ];
  static const List<String> _labels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
  static const int _highlightIndex = 2;

  @override
  Widget build(BuildContext context) {
    final double chartHeight = 80.h;
    // Extra space reserved below the bars for the gap + label text.
    // Kept generous (and label line-height pinned to 1.0) so rounding
    // differences across devices never overflow the column by a pixel.
    final double labelAreaHeight = 26.h;

    return SizedBox(
      height: chartHeight + labelAreaHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(_heights.length, (i) {
          final bool active = i == _highlightIndex;
          return Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: chartHeight * _heights[i],
                    decoration: BoxDecoration(
                      color: active
                          ? const Color(0xFF7F77DD)
                          : const Color(0xFFCECBF6),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.r),
                        topRight: Radius.circular(5.r),
                      ),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    _labels[i],
                    style: TextStyle(
                      fontSize: 10.sp,
                      height: 1.0,
                      fontWeight: active ? FontWeight.w500 : FontWeight.w400,
                      color: active
                          ? const Color(0xFF534AB7)
                          : Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

// ─── Booking row ───

class _BookingRow extends StatelessWidget {
  final String initials;
  final String name;
  final String detail;
  final String time;
  final String status;
  final bool isConfirmed;

  const _BookingRow({
    required this.initials,
    required this.name,
    required this.detail,
    required this.time,
    required this.status,
    required this.isConfirmed,
  });

  @override
  Widget build(BuildContext context) {
    final Color bg = isConfirmed
        ? const Color(0xFFEEEDFE)
        : const Color(0xFFFAECE7);
    final Color fg = isConfirmed
        ? const Color(0xFF3C3489)
        : const Color(0xFF712B13);
    final Color statusColor = fg;

    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5), // light gray surface
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundColor: bg,
            child: Text(
              initials,
              style: TextStyle(
                color: fg,
                fontWeight: FontWeight.w500,
                fontSize: 13.sp,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  detail,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 2.h),
              Text(
                status,
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: isConfirmed ? FontWeight.w500 : FontWeight.w400,
                  color: statusColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
