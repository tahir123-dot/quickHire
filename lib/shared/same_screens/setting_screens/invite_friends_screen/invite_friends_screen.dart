import 'package:flutter/material.dart';

import '../../../../components/setting/list_widget.dart';
import '../../../../components/top_bar_widget/top_bar_widget.dart';
import '../../../../core/size_config/size_config.dart';
import '../../../../core/themes/colors.dart';

class InviteFriendsScreen extends StatefulWidget {
  const InviteFriendsScreen({super.key});

  @override
  State<InviteFriendsScreen> createState() => _InviteFriendsScreenState();
}

class _InviteFriendsScreenState extends State<InviteFriendsScreen> {
  List<Map<String, String>> language = [
    {"title": "Share Link"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: const TopBarIconWithCenterText(pageName: 'Invite Friends'),
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
