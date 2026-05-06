import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/core/themes/app_button_theme.dart';
import 'package:mobile/core/themes/app_input_theme.dart';
import 'package:mobile/core/themes/app_text_theme.dart';
import 'package:mobile/core/themes/colors.dart';

class UserPayment extends StatelessWidget {
  const UserPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        title: const TopBarIconWithCenterText(pageName: 'Payment'),
      ),

      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          children: [
            SizedBox(height: 33.h),

            /// Title
            Text('Payment method', style: AppTextTheme.h1),

            SizedBox(height: 10.h),

            /// Description
            Text(
              "You won't be charged now, payment will be collected in store after your appointment",
              style: AppTextTheme.paragraph,
            ),

            SizedBox(height: 47.h),

            /// Name
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    text: "Name on card ",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "*",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: AppInputTheme.withIcon(
                    hint: 'Add card holder full name',
                    icon: Icons.person_2,
                  ),
                ),
              ],
            ),

            SizedBox(height: 25.h),

            /// Card Number
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    text: "Card number ",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "*",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: AppInputTheme.withIcon(
                    hint: 'Credit or debit card number',
                    icon: Icons.payment,
                  ),
                ),
              ],
            ),

            SizedBox(height: 25.h),

            /// Expiry + CVV
            /// Expiry + CVV (FIXED 🔥)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start, // 👈 IMPORTANT
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Label
                      RichText(
                        text: const TextSpan(
                          text: "Expiry date ",
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: "*",
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// Input
                      TextFormField(
                        decoration: AppInputTheme.withIcon(
                          hint: 'MM/YY',
                          icon: Icons.date_range_sharp,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 10.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Label
                      RichText(
                        text: const TextSpan(
                          text: "Security code ",
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: "*",
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// Input
                      TextFormField(
                        decoration: AppInputTheme.withIcon(
                          hint: '123',
                          icon: Icons.security,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),

            /// Payment icons
            Row(
              children: const [
                Icon(Icons.payments_rounded),
                SizedBox(width: 6),
                Icon(Icons.payments_rounded),
                SizedBox(width: 6),
                Icon(Icons.payments_rounded),
                SizedBox(width: 6),
                Icon(Icons.payments_rounded),
              ],
            ),

            SizedBox(height: 140.h),

            /// Button
            AppButtonTheme.iconTextButton(
              text: 'Pay',
              icon: null,
              backgroundColor: AppColors.blackColor,
              textColor: AppColors.whiteColor,
              onPressed: () {
                print("Payment pay");
              },
            ),

            /// Bottom safe space
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
