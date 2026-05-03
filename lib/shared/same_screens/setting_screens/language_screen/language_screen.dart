import 'package:flutter/material.dart';
import 'package:mobile/components/setting/list_widget.dart';

import '../../../../components/top_bar_widget/top_bar_widget.dart';
import '../../../../core/size_config/size_config.dart';
import '../../../../core/themes/colors.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<Map<String, String>> language = [
    {"title": "English"},
    {"title": "Urdu"},
  ];

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
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.blockWidth * 4.0,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [ListWidget(items: language)]),
        ),
      ),
    );
  }
}
