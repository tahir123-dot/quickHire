import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/themes/colors.dart';
import 'package:mobile/provider/data/entity/team_member_entity.dart';

class TeamCard extends StatefulWidget {
  final TeamMemberEntity member;
  final bool isSelectable;
  final bool showDelete;
  final VoidCallback? onDelete;
  final ValueChanged<bool>? onSelectChanged;

  const TeamCard({
    super.key,
    required this.member,
    this.isSelectable = false,
    this.showDelete = false,
    this.onDelete,
    this.onSelectChanged,
  });

  @override
  State<TeamCard> createState() => _TeamCardState();
}

class _TeamCardState extends State<TeamCard> {
  bool isSelected = false;

  String get _initial =>
      widget.member.name.isNotEmpty ? widget.member.name[0].toUpperCase() : '?';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.searchBarBackground
            : AppColors.transparentBackground,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.searchBarBackground, width: 1),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,

        // ✅ purana CircleAvatar - ab initial letter dikhega
        leading: CircleAvatar(
          radius: 25.r,
          backgroundColor: AppColors.blackColor,
          child: Text(
            _initial,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),

        title: Text(widget.member.name, style: TextStyle(fontSize: 12.sp)),
        subtitle: Text(
          widget.member.ownerType,
          style: TextStyle(fontSize: 11.sp),
        ),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ✅ Delete button - sirf member pe, owner pe nahi
            if (widget.showDelete && !widget.member.isOwner)
              GestureDetector(
                onTap: widget.onDelete,
                child: Icon(
                  Icons.delete_outline,
                  color: Colors.red.shade400,
                  size: 22,
                ),
              ),

            if (widget.showDelete && !widget.member.isOwner)
              SizedBox(width: 8.w),

            // ✅ Select button - purana OutlinedButton style
            if (widget.isSelectable)
              OutlinedButton(
                onPressed: () {
                  setState(() => isSelected = !isSelected);
                  widget.onSelectChanged?.call(isSelected);
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: AppColors.lightgreyColor),
                  backgroundColor: isSelected
                      ? AppColors.blackColor
                      : AppColors.transparentBackground,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 4.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                child: Text(
                  isSelected ? 'Selected' : 'Select',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: isSelected
                        ? AppColors.whiteColor
                        : AppColors.blackColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
