import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/themes/colors.dart';

class BoostPlan extends StatefulWidget {
  const BoostPlan({super.key});

  @override
  State<BoostPlan> createState() => _BoostPlanState();
}

class _BoostPlanState extends State<BoostPlan> {
  int selectDuration = 0; // 0 = weekly, 1 = monthly
  int selectedPlan = 0; // 0 = Local, 1 = Country

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
              color: Colors.grey.withValues(alpha: 0.15),
              width: 0.5,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: _durationTab(
                  title: "Weekly",
                  isActive: selectDuration == 0,
                  onTap: () => setState(() => selectDuration = 0),
                ),
              ),
              Expanded(
                child: _durationTab(
                  title: "Monthly",
                  isActive: selectDuration == 1,
                  onTap: () => setState(() => selectDuration = 1),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 26),

        // ================= LOCAL BOOST =================
        _planCard(
          index: 0,
          title: 'Local Boost',
          description: 'Reach customers in your area',
          weeklyPrice: '9',
          monthlyPrice: '15',
          features: const [
            'Appear in top results for nearby searches',
            'Reach more local customers',
            'Sponsored badge in your area',
          ],
        ),

        const SizedBox(height: 26),

        // ================= COUNTRY BOOST =================
        _planCard(
          index: 1,
          title: 'Country Boost',
          description: 'Reach customers in your country',
          weeklyPrice: '15',
          monthlyPrice: '29',
          features: const [
            'Appear in nationwide search results',
            'Get more profile views',
            'Sponsored badge worldwide',
          ],
        ),
      ],
    );
  }

  // ================= DURATION TAB =================
  Widget _durationTab({
    required String title,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF534AB7) : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? AppColors.whiteColor : AppColors.blackColor,
          ),
        ),
      ),
    );
  }

  // ================= PLAN CARD =================
  Widget _planCard({
    required int index,
    required String title,
    required String description,
    required String weeklyPrice,
    required String monthlyPrice,
    required List<String> features,
  }) {
    final isSelected = selectedPlan == index;

    final borderColor = isSelected
        ? const Color(0xFF534AB7)
        : const Color(0xFF534AB7).withValues(alpha: 0.15);

    final price = selectDuration == 0 ? weeklyPrice : monthlyPrice;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPlan = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 24),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: borderColor, width: isSelected ? 2 : 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TITLE + PRICE
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: TextStyle(fontSize: 16.sp)),
                Text(price, style: TextStyle(fontSize: 16.sp)),
              ],
            ),

            const SizedBox(height: 8),

            // DESCRIPTION
            Text(description, style: TextStyle(fontSize: 12.sp)),

            const SizedBox(height: 12),

            // FEATURES
            ...features.map(
              (f) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 18.sp,
                      color: const Color(0xFF534AB7),
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(f, style: TextStyle(fontSize: 11.sp)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
