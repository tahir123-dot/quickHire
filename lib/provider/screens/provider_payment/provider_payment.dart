import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/app_button_theme.dart';
import '../../../core/themes/app_input_theme.dart';
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
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        surfaceTintColor: AppColors.transparentBackground,
        title: const Text('Payment'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // ✅ Scrollable content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),

                    // ─── Header ───
                    Text(
                      'Payment Method',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      'Provide your payment account details to receive your service earnings directly.',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),

                    SizedBox(height: 20.h),
                    Divider(color: Colors.grey.shade200, thickness: 1),
                    SizedBox(height: 20.h),

                    // ─── Bank Details Section ───
                    _sectionLabel('Bank Details'),
                    SizedBox(height: 14.h),

                    _fieldLabel('Swift Code'),
                    SizedBox(height: 8.h),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: AppInputTheme.withIcon(
                        hint: 'e.g. HABIPKKA',
                        icon: Icons.account_balance_outlined,
                      ),
                    ),
                    SizedBox(height: 14.h),

                    _fieldLabel('Branch Name'),
                    SizedBox(height: 8.h),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: AppInputTheme.withIcon(
                        hint: 'e.g. Main Branch Karachi',
                        icon: Icons.business_outlined,
                      ),
                    ),
                    SizedBox(height: 14.h),

                    // City & Country in a Row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _fieldLabel('City'),
                              SizedBox(height: 8.h),
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                decoration: AppInputTheme.withIcon(
                                  hint: 'Karachi',
                                  icon: Icons.location_city_outlined,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _fieldLabel('Country'),
                              SizedBox(height: 8.h),
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                decoration: AppInputTheme.withIcon(
                                  hint: 'Pakistan',
                                  icon: Icons.flag_outlined,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),

                    _fieldLabel('Branch Address'),
                    SizedBox(height: 8.h),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: AppInputTheme.withIcon(
                        hint: 'e.g. 123 Main Street, Block A',
                        icon: Icons.location_on_outlined,
                      ),
                    ),

                    SizedBox(height: 24.h),
                    Divider(color: Colors.grey.shade200, thickness: 1),
                    SizedBox(height: 20.h),

                    // ─── Card Details Section ───
                    _sectionLabel('Card Details'),
                    SizedBox(height: 14.h),

                    _fieldLabel('Name on Card'),
                    SizedBox(height: 8.h),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: AppInputTheme.withIcon(
                        hint: 'e.g. Ahmed Ali',
                        icon: Icons.person_outline,
                      ),
                    ),
                    SizedBox(height: 14.h),

                    _fieldLabel('Card Number'),
                    SizedBox(height: 8.h),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: AppInputTheme.withIcon(
                        hint: '0000  0000  0000  0000',
                        icon: Icons.credit_card_outlined,
                      ),
                    ),
                    SizedBox(height: 14.h),

                    // Expiry & CVV in a Row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _fieldLabel('Expiry Date'),
                              SizedBox(height: 8.h),
                              TextFormField(
                                keyboardType: TextInputType.datetime,
                                textInputAction: TextInputAction.next,
                                decoration: AppInputTheme.withIcon(
                                  hint: 'MM / YY',
                                  icon: Icons.date_range_outlined,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _fieldLabel('CVV'),
                              SizedBox(height: 8.h),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                obscureText: true,
                                decoration: AppInputTheme.withIcon(
                                  hint: '•••',
                                  icon: Icons.lock_outline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16.h),

                    // ─── Card Icons ───
                    Row(
                      children: [
                        _cardIcon(Icons.payments_rounded),
                        SizedBox(width: 8.w),
                        _cardIcon(Icons.payments_rounded),
                        SizedBox(width: 8.w),
                        _cardIcon(Icons.payments_rounded),
                        SizedBox(width: 8.w),
                        _cardIcon(Icons.payments_rounded),
                      ],
                    ),

                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),

            // ✅ Save button — fixed at bottom
            Container(
              color: AppColors.whiteColor,
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: AppButtonTheme.iconTextButton(
                text: 'Save',
                icon: null,
                backgroundColor: AppColors.blackColor,
                textColor: AppColors.whiteColor,
                onPressed: () {
                  print("Confirm save");
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Helpers ───

  Widget _sectionLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.blackColor,
      ),
    );
  }

  Widget _fieldLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.blackColor,
      ),
    );
  }

  Widget _cardIcon(IconData icon) {
    return Container(
      padding: EdgeInsets.all(6.r),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Icon(icon, size: 20.sp, color: Colors.grey.shade600),
    );
  }
}
