import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/core/themes/colors.dart';
import 'package:mobile/provider/bloc/blocimp/provider_booking_bloc.dart';
import 'package:mobile/provider/bloc/event/provider_booking_event.dart';
import 'package:mobile/provider/bloc/state/provider_booking_state.dart';
import 'package:mobile/provider/screens/provider_booking_screen/component/bookingcard.dart';

class ProviderBookingScreen extends StatelessWidget {
  const ProviderBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProviderBookingBloc>(
      create: (_) =>
          getIt<ProviderBookingBloc>()..add(FetchProviderBookingsEvent()),
      child: const _ProviderBookingScreenContent(),
    );
  }
}

class _ProviderBookingScreenContent extends StatefulWidget {
  const _ProviderBookingScreenContent();

  @override
  State<_ProviderBookingScreenContent> createState() =>
      _ProviderBookingScreenContentState();
}

class _ProviderBookingScreenContentState
    extends State<_ProviderBookingScreenContent> {
  String selectedFilter = 'All';

  final List<String> filter = ['All', 'Confirmed', 'Pending', 'Done'];

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
            titleSpacing: 16.w,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bookings',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackColor,
                  ),
                ),
              ],
            ),
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
                        onTap: () {
                          setState(() {
                            selectedFilter = item;
                          });
                        },
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

        body: BlocListener<ProviderBookingBloc, ProviderBookingState>(
          listener: (context, state) {
            if (state is ProviderBookingStatusUpdated) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Booking status updated successfully'),
                ),
              );
            }

            if (state is ProviderBookingStatusUpdateError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },

          child: RefreshIndicator(
            onRefresh: () async {
              context.read<ProviderBookingBloc>().add(
                FetchProviderBookingsEvent(),
              );
              await Future.delayed(const Duration(milliseconds: 600));
            },
            child: BlocBuilder<ProviderBookingBloc, ProviderBookingState>(
              builder: (context, state) {
                if (state is ProviderBookingLoading) {
                  return ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      SizedBox(height: 200.h),
                      const Center(child: CircularProgressIndicator()),
                    ],
                  );
                }

                if (state is ProviderBookingError) {
                  return ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      SizedBox(height: 200.h),
                      Center(child: Text(state.message)),
                    ],
                  );
                }

                if (state is ProviderBookingEmpty) {
                  return ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      SizedBox(height: 200.h),
                      const Center(child: Text("No bookings yet")),
                    ],
                  );
                }

                if (state is ProviderBookingStatusUpdating) {
                  return ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      SizedBox(height: 200.h),
                      const Center(child: CircularProgressIndicator()),
                    ],
                  );
                }

                if (state is ProviderBookingLoaded) {
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
                    return ListView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        SizedBox(height: 200.h),
                        const Center(
                          child: Text("No bookings in this category"),
                        ),
                      ],
                    );
                  }

                  return ListView.separated(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: filteredBookings.length,

                    separatorBuilder: (_, _) => SizedBox(height: 12.h),

                    itemBuilder: (_, index) {
                      final booking = filteredBookings[index];

                      return BookingCardR(
                        booking: booking,
                        onAccept: () {
                          context.read<ProviderBookingBloc>().add(
                            UpdateProviderBookingStatusEvent(
                              bookingId: booking.id,
                              status: "confirmed",
                            ),
                          );
                        },

                        onDecline: () {
                          context.read<ProviderBookingBloc>().add(
                            UpdateProviderBookingStatusEvent(
                              bookingId: booking.id,
                              status: "declined",
                            ),
                          );
                        },

                        onMarkDone: () {
                          context.read<ProviderBookingBloc>().add(
                            UpdateProviderBookingStatusEvent(
                              bookingId: booking.id,
                              status: "done",
                            ),
                          );
                        },
                      );
                    },
                  );
                }

                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
