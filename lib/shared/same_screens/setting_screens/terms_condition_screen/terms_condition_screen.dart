import 'package:flutter/material.dart';

import '../../../../components/top_bar_widget/top_bar_widget.dart';
import '../../../../core/themes/colors.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        title: TopBarIconWithCenterText(pageName: 'Terms and Conditions'),
      ),
      body: Center(child: Text('Terms Conditions screen')),
    );
  }
}
