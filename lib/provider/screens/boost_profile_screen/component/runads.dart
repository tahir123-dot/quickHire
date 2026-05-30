import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/themes/colors.dart';

class RunAdsPlan extends StatefulWidget {
  const RunAdsPlan({super.key});

  @override
  State<RunAdsPlan> createState() => _RunAdsPlanState();
}

class _RunAdsPlanState extends State<RunAdsPlan> {
  @override
  Widget build(BuildContext context) {
    return _planCardPro(
      title: 'Pro Pack',
      description: 'Job Feed + QR Card + Bundles',
      monthlyPrice: '29.99/mo',
      features: [
        'Job Request Feed — customers come to you directly',
        'Service Bundles — earn more',
        'QR Card — build trust',
      ],
    );
  }

  // ================= PLAN CARD =================
  Widget _planCardPro({
    required String title,
    required String description,
    required String monthlyPrice,
    required List<String> features,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 24),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xff854f0b), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TITLE + PRICE
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontSize: 16.sp)),
              Text(
                monthlyPrice,
                style: TextStyle(fontSize: 16.sp, color: Color(0xff854f0b)),
              ),
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
                    color: const Color(0xff854f0b),
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
    );
  }
}
