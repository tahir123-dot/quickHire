import 'package:flutter/material.dart';

import '../../../components/top_bar_widget/top_bar_widget.dart';
import '../../../core/size_config/size_config.dart';
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
                      "Kindly provide your payment account details to receive your service earnings directly in this account.",
                      style: AppTextTheme.paragraph,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 25),
                    TextFormField(
                      decoration: AppInputTheme.withIcon(
                        labelText: 'Swift Code',
                        hint: 'Add swift code of you Bank',
                        icon: Icons.person_2,
                      ),
                    ),
                    SizedBox(height: 25),
                    TextFormField(
                      decoration: AppInputTheme.withIcon(
                        labelText: 'Branch Name',
                        hint: 'Add card holder full name',
                        icon: Icons.payment,
                      ),
                    ),
                    SizedBox(height: 25),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: AppInputTheme.withIcon(
                              labelText: 'City',
                              hint: 'City',
                              icon: Icons.date_range_sharp,
                            ),
                          ),
                        ),
                        SizedBox(width: 10), // input boxes ke beech space
                        Expanded(
                          child: TextFormField(
                            decoration: AppInputTheme.withIcon(
                              labelText: 'Country',
                              hint: 'Country',
                              icon: Icons.security,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //branch Name
                    SizedBox(height: 25),
                    TextFormField(
                      decoration: AppInputTheme.withIcon(
                        labelText: 'Branch Address',
                        hint: 'Add bank address',
                        icon: Icons.payment,
                      ),
                    ),

                    //Name on Card
                    SizedBox(height: 25),
                    TextFormField(
                      decoration: AppInputTheme.withIcon(
                        labelText: 'Name on card*',
                        hint: 'Add card holder full name',
                        icon: Icons.payment,
                      ),
                    ),

                    //IBan Number
                    SizedBox(height: 25),
                    TextFormField(
                      decoration: AppInputTheme.withIcon(
                        labelText: 'IBAN number',
                        hint: 'Add Iban number',
                        icon: Icons.payment,
                      ),
                    ),

                    //Card Number
                    SizedBox(height: 25),
                    TextFormField(
                      decoration: AppInputTheme.withIcon(
                        labelText: 'Card number*',
                        hint: 'Card number*',
                        icon: Icons.payment,
                      ),
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
                text: 'Save',
                icon: null,
                backgroundColor: AppColors.blackColor,
                textColor: AppColors.whiteColor,
                onPressed: () {
                  print("Save payment details");
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
