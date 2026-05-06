import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../components/setting/list_widget.dart';
import '../../../../components/top_bar_widget/top_bar_widget.dart';
import '../../../../core/themes/colors.dart';

class AppVersionScreen extends StatefulWidget {
  const AppVersionScreen({super.key});

  @override
  State<AppVersionScreen> createState() => _AppVersionScreenState();
}

class _AppVersionScreenState extends State<AppVersionScreen> {
  late final List<ListItemModel> versionList;

  @override
  void initState() {
    super.initState();

    versionList = [ListItemModel(title: "Version 1.0.0")];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: const TopBarIconWithCenterText(pageName: 'App Version'),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 43.w),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 43.h),
              Text('Latest Version', style: TextStyle(fontSize: 19.sp)),
              SizedBox(height: 16.h),
              ListWidget(items: versionList),
            ],
          ),
        ),
      ),
    );
  }
}
