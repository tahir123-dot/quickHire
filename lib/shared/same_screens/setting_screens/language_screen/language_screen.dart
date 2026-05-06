import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/components/setting/list_widget.dart';

import '../../../../components/top_bar_widget/top_bar_widget.dart';
import '../../../../core/themes/colors.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  late final List<ListItemModel> languageList;

  @override
  void initState() {
    super.initState();

    languageList = [
      ListItemModel(title: "English"),
      ListItemModel(title: "Urdu"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: const TopBarIconWithCenterText(pageName: 'Language'),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 43.w),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 43.h),
              Text('Select App Language', style: TextStyle(fontSize: 19.sp)),
              SizedBox(height: 16.h),
              ListWidget(items: languageList),
            ],
          ),
        ),
      ),
    );
  }
}
