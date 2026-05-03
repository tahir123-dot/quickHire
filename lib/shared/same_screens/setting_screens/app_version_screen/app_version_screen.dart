import 'package:flutter/material.dart';

import '../../../../components/setting/list_widget.dart';
import '../../../../components/top_bar_widget/top_bar_widget.dart';
import '../../../../core/size_config/size_config.dart';
import '../../../../core/themes/colors.dart';

class AppVersionScreen extends StatefulWidget {
  const AppVersionScreen({super.key});

  @override
  State<AppVersionScreen> createState() => _AppVersionScreenState();
}

class _AppVersionScreenState extends State<AppVersionScreen> {
  List<Map<String, String>> language = [
    {"title": "Version 1.0.0"},
  ];

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
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockWidth * 4.0,
          ),
          child: Column(crossAxisAlignment:CrossAxisAlignment.start,children: [ListWidget(items: language)]),
        ),
      ),
    );
  }
}
