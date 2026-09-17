import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/provider/bloc/blocimp/provider_dashboard_bloc.dart';
import 'package:mobile/provider/bloc/event/provider_dashboard_event.dart';
import 'package:mobile/provider/bloc/state/provider_dashboard_state.dart';
import 'package:mobile/provider/data/model/provider_dashbarod_model.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();

    context.read<ProviderDashboardBloc>().add(GetProviderDashboard());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<ProviderDashboardBloc>().add(GetProviderDashboard());
            await Future.delayed(const Duration(seconds: 1));
          },
          child: BlocBuilder<ProviderDashboardBloc, ProviderDashboardState>(
            builder: (context, state) {
              if (state is ProviderDashboardLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is ProviderDashboardError) {
                return Center(child: Text(state.message));
              }

              if (state is ProviderDashboardLoaded) {
                return _DashboardContent(dashboard: state.dashboard);
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}

class _DashboardContent extends StatelessWidget {
  final DashboardModel dashboard;

  const _DashboardContent({required this.dashboard});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      children: [
        TopBarWidget(),

        SizedBox(height: 16.h),

        _EarningsCard(dashboard: dashboard),

        SizedBox(height: 24.h),

        Text(
          "This week's bookings",
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
        ),

        SizedBox(height: 4.h),

        Text(
          "Weekly booking activity",
          style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
        ),

        SizedBox(height: 12.h),

        _WeeklyBarChart(bookings: dashboard.weeklyBookings),

        SizedBox(height: 24.h),

        Text(
          "Upcoming bookings",
          style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
        ),

        SizedBox(height: 12.h),

        ...dashboard.upcomingBookings.map(
          (booking) => Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: _BookingRow(booking: booking),
          ),
        ),

        SizedBox(height: 24.h),
      ],
    );
  }
}
// ─── Earnings hero card ───

class _EarningsCard extends StatelessWidget {
  final DashboardModel dashboard;

  const _EarningsCard({required this.dashboard});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: const Color(0xFFEEEDFE),
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
            'Rs ${dashboard.todayEarnings.toStringAsFixed(0)}',
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF26215C),
            ),
          ),
          SizedBox(height: 14.h),
          Row(
            children: [
              _HeroStat(
                value: '${dashboard.totalBookingsToday}',
                label: 'Bookings',
              ),
              SizedBox(width: 24.w),
              _HeroStat(
                value: dashboard.rating != null
                    ? '${dashboard.rating!.toStringAsFixed(1)} ★'
                    : 'N/A',
                label: '${dashboard.totalReviews} reviews',
              ),
              SizedBox(width: 24.w),
              _HeroStat(
                value: '${dashboard.acceptRate.toStringAsFixed(0)}%',
                label: 'Accept rate',
              ),
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
  final List<WeeklyBookingModel> bookings;

  const _WeeklyBarChart({required this.bookings});

  @override
  Widget build(BuildContext context) {
    final double chartHeight = 80.h;
    final double labelAreaHeight = 26.h;

    final int maxCount = bookings.isEmpty
        ? 1
        : bookings.map((e) => e.count).reduce((a, b) => a > b ? a : b);

    return SizedBox(
      height: chartHeight + labelAreaHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(bookings.length, (i) {
          final booking = bookings[i];

          final bool active = booking.isToday;

          final double barHeight = maxCount == 0
              ? 4.h
              : chartHeight * (booking.count / maxCount);

          return Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: barHeight,
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
                    booking.day.substring(0, 1),
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
  final UpcomingBookingModel booking;

  const _BookingRow({required this.booking});

  @override
  Widget build(BuildContext context) {
    // Booking status check
    final bool isConfirmed = booking.status.toLowerCase() == 'confirmed';

    // Customer avatar background color
    final Color bg = isConfirmed
        ? const Color(0xFFEEEDFE)
        : const Color(0xFFFAECE7);

    // Customer avatar + status text color
    final Color fg = isConfirmed
        ? const Color(0xFF3C3489)
        : const Color(0xFF712B13);

    final Color statusColor = fg;

    // Detail + dateLabel
    final String detail = booking.dateLabel.isNotEmpty
        ? '${booking.detail} · ${booking.dateLabel}'
        : booking.detail;

    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundColor: bg,
            child: Text(
              booking.customerInitials,
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
                  booking.customerName,
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
                booking.time,
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
              ),

              SizedBox(height: 2.h),

              Text(
                booking.status,
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
