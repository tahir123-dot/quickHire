import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/components/team_card/team_card.dart';
import 'package:mobile/core/themes/app_text_theme.dart';
import 'package:mobile/provider/bloc/blocimp/provider_bloc.dart';
import 'package:mobile/provider/bloc/event/provider_event.dart';
import 'package:mobile/provider/bloc/state/provider_state.dart';
import '../../../../../core/themes/colors.dart';

class TeamListScreen extends StatefulWidget {
  const TeamListScreen({super.key});

  @override
  State<TeamListScreen> createState() => _TeamListScreenState();
}

class _TeamListScreenState extends State<TeamListScreen> {
  static const _serviceProviderId = '6a1e6abbb5759b02bac59cc1';

  @override
  void initState() {
    super.initState();
    context.read<ProviderBloc>().add(
      FetchTeamListEvent(serviceProviderId: _serviceProviderId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProviderBloc, ProviderState>(
      listener: (context, state) {
        if (state is ProviderError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          surfaceTintColor: AppColors.transparentBackground,
          title: const Text('Team'),
        ),
        body: SafeArea(
          child: BlocBuilder<ProviderBloc, ProviderState>(
            builder: (context, state) {
              // loading
              if (state is ProviderLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              // loaded
              if (state is TeamListLoaded) {
                if (state.members.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.group_outlined,
                          size: 64,
                          color: Colors.grey.shade300,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'No team members yet',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 42.h),
                      Text('Team', style: AppTextTheme.h1),
                      SizedBox(height: 10.h),
                      const Text(
                        "Customers can select them for bookings, but all payments and bookings stay with the shop.",
                      ),
                      SizedBox(height: 30.h),

                      // ✅ list
                      ...state.members.map(
                        (member) => Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: TeamCard(
                            member: member,
                            showDelete: true, // provider side
                            isSelectable: false, // customer side pe true hoga
                            onDelete: () =>
                                _confirmDelete(context, member.id, member.name),
                          ),
                        ),
                      ),

                      SizedBox(height: 20.h),
                    ],
                  ),
                );
              }

              // error
              if (state is ProviderError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 48,
                        color: Colors.red.shade300,
                      ),
                      SizedBox(height: 12.h),
                      TextButton(
                        onPressed: () => context.read<ProviderBloc>().add(
                          FetchTeamListEvent(
                            serviceProviderId: _serviceProviderId,
                          ),
                        ),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, String memberId, String name) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        title: const Text('Remove Member'),
        content: Text('Are you sure you want to remove "$name" from team?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // ✅ event dispatch
              context.read<ProviderBloc>().add(
                DeleteTeamMemberEvent(teamMemberId: memberId),
              );
            },
            child: Text('Remove', style: TextStyle(color: Colors.red.shade400)),
          ),
        ],
      ),
    );
  }
}
