import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/core/data/timezones.dart';
import 'package:mobile/core/themes/colors.dart';

class TimeZoneSelectScreen extends StatefulWidget {
  const TimeZoneSelectScreen({super.key});

  @override
  State<TimeZoneSelectScreen> createState() => _TimeZoneSelectScreenState();
}

class _TimeZoneSelectScreenState extends State<TimeZoneSelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.transparentBackground,
        elevation: 3,
        shadowColor: AppColors.blackColor.withValues(alpha: 0.2),
        title: TopBarIconWithCenterText(pageName: 'Availability'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 31.w),
        children: [
          Wrap(
            children: AppTimeZones.zones.map((zone) {
              return ListTile(
                title: Text(zone["name"]!),
                onTap: () {
                  print(zone["tz"]);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
