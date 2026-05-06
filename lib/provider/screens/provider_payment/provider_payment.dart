import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/top_bar_widget/top_bar_widget.dart';
import '../../../core/themes/app_button_theme.dart';
import '../../../core/themes/app_input_theme.dart';
import '../../../core/themes/app_text_theme.dart';
import '../../../core/themes/colors.dart';

class ProviderPayment extends StatefulWidget {
  const ProviderPayment({super.key});

  @override
  State<ProviderPayment> createState() => _ProviderPaymentState();
}

class _ProviderPaymentState extends State<ProviderPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        title: TopBarIconWithCenterText(pageName: 'Payment'),
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
              "Kindly provide your payment account details to receive your service earnings directly in this account.",
              style: AppTextTheme.paragraph,
            ),

            SizedBox(height: 47.h),

            /// Swift Code
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    text: "Swift Code ",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: AppInputTheme.withIcon(
                    hint: 'Add swift code of you Bank',
                    icon: Icons.person_2,
                  ),
                ),
              ],
            ),

            SizedBox(height: 25.h),

            /// Branch Name
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    text: "Branch Name",
                    style: TextStyle(color: Colors.black),
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

            // city and country
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
                          text: "City",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// Input
                      TextFormField(
                        decoration: AppInputTheme.withIcon(
                          hint: 'city',
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
                          text: "Country",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// Input
                      TextFormField(
                        decoration: AppInputTheme.withIcon(
                          hint: 'country',
                          icon: Icons.flag,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 25.h),

            /// Branch Addresss
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    text: "Branch Address",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: AppInputTheme.withIcon(
                    hint: 'Add bank address',
                    icon: Icons.person_2,
                  ),
                ),
              ],
            ),

            SizedBox(height: 25.h),

            /// Name on Card
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    text: "Name on card",
                    style: TextStyle(color: Colors.black),
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
                    text: "Card number",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: AppInputTheme.withIcon(
                    hint: 'Credit or debit card number',
                    icon: Icons.person_2,
                  ),
                ),
              ],
            ),

            SizedBox(height: 25.h),

            // expire date securiyt code
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
                          text: "Expiry date",
                          style: TextStyle(color: Colors.black),
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
                          text: "Security code",
                          style: TextStyle(color: Colors.black),
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

            SizedBox(height: 60.h),

            /// Button
            AppButtonTheme.iconTextButton(
              text: 'Save',
              icon: null,
              backgroundColor: AppColors.blackColor,
              textColor: AppColors.whiteColor,
              onPressed: () {
                print("Confirm save");
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
