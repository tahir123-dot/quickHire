import 'package:flutter/material.dart';
import 'package:mobile/core/size_config/size_config.dart';
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
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: isSelect
            ? AppColors.searchBarBackground
            : AppColors.transparentBackground,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.searchBarBackground, width: 1),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage("assets/images/user.png"),
        ),
        title: Text(
          'Tahir Rashid',
          style: TextStyle(fontSize: SizeConfig.blockWidth * 4),
        ),
        subtitle: Text(
          "Islamabad F6",
          style: TextStyle(fontSize: SizeConfig.blockWidth * 3),
        ),
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
            side: BorderSide(color: AppColors.blackColor),
            backgroundColor: isSelect
                ? AppColors.blackColor
                : AppColors.transparentBackground,
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: Text(
            widget.actionText,
            style: TextStyle(
              fontSize: SizeConfig.blockWidth * 3,
              color: isSelect ? AppColors.whiteColor : AppColors.blackColor,
            ),
          ),
        ),
      ),
    );
  }
}
