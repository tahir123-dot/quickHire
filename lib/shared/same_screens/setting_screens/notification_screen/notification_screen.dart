import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/shared/bloc/blocimpl/notification_bloc.dart';
import 'package:mobile/shared/bloc/event/notification_event.dart';
import 'package:mobile/shared/bloc/state/notification_state.dart';
import '../../../../core/themes/colors.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationBloc>().add(LoadNotificationsEvent());
  }

  IconData _iconForType(String type) {
    switch (type) {
      case 'confirmed':
        return Icons.check_circle_outline;
      case 'cancelled':
        return Icons.cancel_outlined;
      case 'declined':
        return Icons.block_outlined;
      case 'done':
        return Icons.task_alt_outlined;
      default:
        return Icons.notifications_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.transparentBackground,
        title: const Text('Notification'),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            final bloc = context.read<NotificationBloc>();
            bloc.add(LoadNotificationsEvent());

            await bloc.stream.firstWhere(
              (state) =>
                  state is NotificationLoaded || state is NotificationError,
            );
          },
          child: BlocBuilder<NotificationBloc, NotificationState>(
            builder: (context, state) {
              if (state is NotificationLoading ||
                  state is NotificationInitial) {
                return ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    SizedBox(height: 200.h),
                    const Center(child: CircularProgressIndicator()),
                  ],
                );
              }

              if (state is NotificationError) {
                return ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    SizedBox(height: 200.h),
                    Center(
                      child: Text(
                        state.message,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: AppColors.lightgreyColor,
                        ),
                      ),
                    ),
                  ],
                );
              }

              final notifications = (state as NotificationLoaded).notifications;

              if (notifications.isEmpty) {
                return ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    SizedBox(height: 200.h),
                    Center(
                      child: Text(
                        'No Notification Right Now',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: AppColors.lightgreyColor,
                        ),
                      ),
                    ),
                  ],
                );
              }

              return ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 20.h),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final n = notifications[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: AppColors.searchBarBackground,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 5.h,
                      ),
                      leading: CircleAvatar(
                        radius: 25.r,
                        backgroundColor: AppColors.purpleLight,
                        child: Icon(
                          _iconForType(n.type),
                          color: AppColors.blackColor,
                          size: 22.sp,
                        ),
                      ),
                      title: Text(
                        n.title,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: n.isRead
                              ? FontWeight.w400
                              : FontWeight.w600,
                        ),
                      ),
                      subtitle: Text(
                        n.message,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.lightgreyColor,
                        ),
                      ),
                      trailing: Text(
                        n.timeAgo,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: AppColors.lightgreyColor,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 8.h),
              );
            },
          ),
        ),
      ),
    );
  }
}
