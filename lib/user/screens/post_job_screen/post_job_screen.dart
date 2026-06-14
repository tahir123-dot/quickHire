import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/themes/app_input_theme.dart';
import 'package:mobile/core/themes/colors.dart';

class PostJobScreen extends StatefulWidget {
  const PostJobScreen({super.key});

  @override
  State<PostJobScreen> createState() => _PostJobScreenState();
}

class _PostJobScreenState extends State<PostJobScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0Xfff8f8f6),
      appBar: AppBar(
        backgroundColor: AppColors.transparentBackground,
        surfaceTintColor: AppColors.transparentBackground,
        title: Text('Post job'),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 43.w),
          children: [
            SizedBox(height: 19.h),

            // problem
            RichText(
              text: const TextSpan(
                text: "What's the issue?",
                style: TextStyle(color: Colors.black),
              ),
            ),

            const SizedBox(height: 8),

            /// Input
            TextFormField(
              maxLines: 7, //  box height increase
              minLines: 5,
              keyboardType: TextInputType.multiline,

              decoration: AppInputTheme.withIcon(
                hint: 'water leakage',
                icon: null,
              ),
            ),

            SizedBox(height: 19.h),

            // Business name
            RichText(
              text: const TextSpan(
                text: "Select Category",
                style: TextStyle(color: Colors.black),
              ),
            ),

            const SizedBox(height: 8),

            /// Input
            TextFormField(
              decoration: AppInputTheme.withIcon(
                hint: 'Plumbing',
                icon: Icons.plumbing_rounded,
              ),
            ),

            SizedBox(height: 19.h),

            Container(
              alignment: Alignment.center,

              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Color(0xFF534AB7),

                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                "Post",
                style: TextStyle(color: AppColors.whiteColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
