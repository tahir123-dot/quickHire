import 'package:flutter/material.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/core/themes/app_button_theme.dart';

import '../../../core/size_config/size_config.dart';
import '../../../core/themes/app_input_theme.dart';
import '../../../core/themes/app_text_theme.dart';
import '../../../core/themes/colors.dart';

class UserPayment extends StatefulWidget {
  const UserPayment({super.key});

  @override
  State<UserPayment> createState() => _UserPaymentState();
}

class _UserPaymentState extends State<UserPayment> {
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
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockWidth * 6.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: SizeConfig.blockHeight * 5),

                    SizedBox(
                      width: double.infinity,
                      child: Text('Payment method', style: AppTextTheme.h1),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "You won't be charged now, payment will be collected in store after your appointment",
                      style: AppTextTheme.paragraph,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 25),
                    TextFormField(
                      decoration: AppInputTheme.withIcon(
                        labelText: 'Name on card*',
                        hint: 'Add card holder full name',
                        icon: Icons.person_2,
                      ),
                    ),
                    SizedBox(height: 25),
                    TextFormField(
                      decoration: AppInputTheme.withIcon(
                        labelText: 'Card number*',
                        hint: 'Credit or debit card number',
                        icon: Icons.payment,
                      ),
                    ),
                    SizedBox(height: 25),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: AppInputTheme.withIcon(
                              labelText: 'Expiry date*',
                              hint: 'MM/YY',
                              icon: Icons.date_range_sharp,
                            ),
                          ),
                        ),
                        SizedBox(width: 10), // input boxes ke beech space
                        Expanded(
                          child: TextFormField(
                            decoration: AppInputTheme.withIcon(
                              labelText: 'Security code*',
                              hint: '123',
                              icon: Icons.security,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            print("visa");
                          },
                          icon: Icon(Icons.payments_rounded),
                        ),
                        SizedBox(width: 1),
                        IconButton(
                          onPressed: () {
                            print("visa");
                          },
                          icon: Icon(Icons.payments_rounded),
                        ),

                        SizedBox(width: 2),

                        IconButton(
                          onPressed: () {
                            print("visa");
                          },
                          icon: Icon(Icons.payments_rounded),
                        ),

                        SizedBox(width: 3),

                        IconButton(
                          onPressed: () {
                            print("visa");
                          },
                          icon: Icon(Icons.payments_rounded),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.blockWidth * 6.0,
              ),
              child: AppButtonTheme.iconTextButton(
                text: 'Pay',
                icon: null,
                backgroundColor: AppColors.blackColor,
                textColor: AppColors.whiteColor,
                onPressed: () {
                  print("Payment pay");
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
