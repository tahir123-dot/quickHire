import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../components/setting/list_widget.dart';
import '../../../../components/top_bar_widget/top_bar_widget.dart';
import '../../../../core/themes/colors.dart';

class InviteFriendsScreen extends StatefulWidget {
  const InviteFriendsScreen({super.key});

  @override
  State<InviteFriendsScreen> createState() => _InviteFriendsScreenState();
}

class _InviteFriendsScreenState extends State<InviteFriendsScreen> {
  late final List<ListItemModel> inviteList;

  @override
  void initState() {
    super.initState();

    inviteList = [
      ListItemModel(
        title: "Share Link",
        onTap: () {
          // 🔥 yahan future mein share logic lagana
          print("Share Link clicked");
        },
      ),
    ];
  }

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
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ListWidget(items: inviteList)],
          ),
        ),
      ),
    );
  }
}
