import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/user/bloc/blocimpl/customer_booking_bloc.dart';
import 'package:mobile/user/bloc/event/customer_booking_event.dart';
import 'package:mobile/user/bloc/state/customer_booking_state.dart';
import 'package:mobile/user/screens/booking_screen/customerbookingcard.dart';

import '../../../core/themes/colors.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CustomerBookingBloc>(
      create: (_) =>
          getIt<CustomerBookingBloc>()..add(FetchCustomerBookingsEvent()),
      child: const _BookingScreenContent(),
    );
  }
}

class _BookingScreenContent extends StatefulWidget {
  const _BookingScreenContent();

  @override
  State<_BookingScreenContent> createState() => _BookingScreenContentState();
}

class _BookingScreenContentState extends State<_BookingScreenContent> {
  String selectedFilter = 'All';
  final List<String> filter = [
    'All',
    'Pending',
    'Confirmed',
    'Done',
    'Cancelled',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F6),
      body: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverAppBar(
            pinned: true,
            floating: true,
            backgroundColor: AppColors.whiteColor,
            surfaceTintColor: AppColors.transparentBackground,
            elevation: 0,
            automaticallyImplyLeading: false,
            titleSpacing: 16.w,
            title: const TopBarMinimal(pageName: 'Activity'),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50.h),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 10.h),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: filter.map((item) {
                      final isSelected = selectedFilter == item;
                      return GestureDetector(
                        onTap: () => setState(() => selectedFilter = item),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          margin: EdgeInsets.only(right: 8.w),
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFF534AB7)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFF534AB7)
                                  : Colors.grey.shade300,
                            ),
                          ),
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              color: isSelected
                                  ? Colors.white
                                  : Colors.grey.shade600,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
        body: BlocConsumer<CustomerBookingBloc, CustomerBookingState>(
          listener: (context, state) {
            if (state is CustomerBookingCancelSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Booking cancelled")),
              );
              context.read<CustomerBookingBloc>().add(
                FetchCustomerBookingsEvent(),
              );
            }
            if (state is CustomerBookingCancelError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is CustomerBookingLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is CustomerBookingError) {
              return Center(child: Text(state.message));
            }

            if (state is CustomerBookingEmpty) {
              return const Center(child: Text("No bookings yet"));
            }

            if (state is CustomerBookingLoaded) {
              final filteredBookings = selectedFilter == 'All'
                  ? state.bookings
                  : state.bookings
                        .where(
                          (b) =>
                              b.status.toLowerCase() ==
                              selectedFilter.toLowerCase(),
                        )
                        .toList();

              if (filteredBookings.isEmpty) {
                return const Center(
                  child: Text("No bookings in this category"),
                );
              }

              return ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                physics: const BouncingScrollPhysics(),
                itemCount: filteredBookings.length,
                separatorBuilder: (_, __) => SizedBox(height: 12.h),
                itemBuilder: (_, index) {
                  final booking = filteredBookings[index];
                  return CustomerBookingCard(
                    booking: booking,
                    onCancel: () => _confirmCancel(context, booking.id),
                  );
                },
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  void _confirmCancel(BuildContext context, String bookingId) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text("Cancel Booking"),
        content: const Text("Are you sure you want to cancel this booking?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text("No"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.read<CustomerBookingBloc>().add(
                CancelCustomerBookingEvent(bookingId: bookingId),
              );
            },
            child: const Text("Yes, Cancel"),
          ),
        ],
      ),
    );
  }
}
