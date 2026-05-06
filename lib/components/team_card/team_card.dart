import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/themes/colors.dart';

class TeamCard extends StatefulWidget {
  final String actionText;
  final bool isSelectable;
  const TeamCard({
    super.key,
    required this.actionText,
    this.isSelectable = false,
  });

  @override
  State<TeamCard> createState() => _TeamCardState();
}

class _TeamCardState extends State<TeamCard> {
  bool isSelect = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: isSelect
            ? AppColors.searchBarBackground
            : AppColors.transparentBackground,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.searchBarBackground, width: 1),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 25.r,
          backgroundImage: AssetImage("assets/images/user.png"),
        ),
        title: Text('Tahir Rashid', style: TextStyle(fontSize: 12.sp)),
        subtitle: Text("Islamabad F6", style: TextStyle(fontSize: 11.sp)),
        trailing: OutlinedButton(
          onPressed: () {
            setState(() {
              if (widget.isSelectable) {
                isSelect = !isSelect;
              } else {
                null;
              }
            });
          },
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: AppColors.lightgreyColor),
            backgroundColor: isSelect
                ? AppColors.blackColor
                : AppColors.transparentBackground,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
          child: Text(
            widget.actionText,
            style: TextStyle(
              fontSize: 12.sp, //SizeConfig.blockWidth * 3,
              color: isSelect ? AppColors.whiteColor : AppColors.blackColor,
            ),
          ),
        ),
      ),
    );
  }
}
