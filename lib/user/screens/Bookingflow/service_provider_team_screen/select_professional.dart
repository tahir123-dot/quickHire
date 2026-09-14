import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:mobile/core/injection/injection_container.dart';
import 'package:mobile/core/themes/app_button_theme.dart';
import 'package:mobile/core/themes/app_text_theme.dart';
import 'package:mobile/provider/data/entity/team_member_entity.dart';
import 'package:mobile/routes/user_routes/user_routes_constants.dart';
import 'package:mobile/user/bloc/blocimpl/booking_cubit.dart';
import 'package:mobile/user/bloc/blocimpl/provider_profile_bloc.dart';
import 'package:mobile/user/bloc/event/provider_profile_event.dart';
import 'package:mobile/user/bloc/state/provider_profile_state.dart';

import '../../../../components/team_card/team_card.dart';
import '../../../../components/top_bar_widget/top_bar_widget.dart';
import '../../../../core/themes/colors.dart';

class SelectProfessional extends StatelessWidget {
  final String providerId;
  const SelectProfessional({super.key, required this.providerId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProviderProfileViewBloc>(
      create: (_) =>
          getIt<ProviderProfileViewBloc>()
            ..add(FetchProviderTeamMembersEvent(providerId: providerId)),
      child: _SelectProfessionalContent(providerId: providerId),
    );
  }
}

class _SelectProfessionalContent extends StatefulWidget {
  final String providerId;
  const _SelectProfessionalContent({required this.providerId});

  @override
  State<_SelectProfessionalContent> createState() =>
      _SelectProfessionalContentState();
}

class _SelectProfessionalContentState
    extends State<_SelectProfessionalContent> {
  String? selectedMemberId;
  TeamMemberEntity? selectedMember;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: TopBarIconWithCenterText(pageName: 'SelectProfessional'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 42.h),
              Text('Select Professional', style: AppTextTheme.h1),
              SizedBox(height: 10.h),
              Text(
                "Customers can select them for bookings, but all payments and bookings stay with the shop.",
              ),
              SizedBox(height: 40.h),
              BlocBuilder<ProviderProfileViewBloc, ProviderProfileViewState>(
                builder: (context, state) {
                  if (state is ProviderTeamMembersLoading) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (state is ProviderTeamMembersError) {
                    return Center(child: Text(state.message));
                  }

                  if (state is ProviderTeamMembersLoaded) {
                    if (state.teamMembers.isEmpty) {
                      return Text("No team members available");
                    }
                    return Column(
                      children: state.teamMembers.map((member) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 28.h),
                          child: TeamCard(
                            member: member,
                            isSelectable: true,
                            showDelete: false,
                            onSelectChanged: (isSelected) {
                              setState(() {
                                selectedMemberId = isSelected
                                    ? member.id
                                    : null;
                                selectedMember = isSelected
                                    ? member
                                    : null; // 👈 yahan save kar liya
                              });
                            },
                          ),
                        );
                      }).toList(),
                    );
                  }

                  return SizedBox();
                },
              ),

              SizedBox(height: 20.h),

              AppButtonTheme.iconTextButton(
                text: 'Continue',
                icon: null,
                backgroundColor: AppColors.blackColor,
                textColor: AppColors.whiteColor,
                onPressed: selectedMember == null
                    ? null
                    : () {
                        context.read<BookingCubit>().setTeamMember(
                          memberId: selectedMember!.id,
                          memberName: selectedMember!.name,
                          ownerId: selectedMember!.ownerId,
                        );

                        context.push(
                          UserRoutesConstants.calender,
                          extra: selectedMember!.ownerId,
                        );
                      },
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
