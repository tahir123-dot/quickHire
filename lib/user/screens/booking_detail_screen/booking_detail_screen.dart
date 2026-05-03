import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/routes/user_routes/user_routes_constants.dart';

import '../../../core/size_config/size_config.dart';
import '../../../core/themes/app_button_theme.dart';
import '../../../core/themes/colors.dart';

class BookingDetailScreen extends StatefulWidget {
  const BookingDetailScreen({super.key});

  @override
  State<BookingDetailScreen> createState() => _BookingDetailScreenState();
}

class _BookingDetailScreenState extends State<BookingDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Booking detail screen')),
      body: SafeArea(
        child: Column(
          children: [
            // ✅ Scrollable content
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockWidth * 7.0,
                  vertical: SizeConfig.blockHeight * 2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: SizeConfig.blockHeight * 2),

                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/images/user.png"),
                      ),
                      title: Row(
                        children: [
                          Text("Tahir Rashid"),
                          SizedBox(width: 5),
                          Icon(
                            Icons.verified,
                            color: AppColors.darkBlueColor,
                            size: 15,
                          ),
                        ],
                      ),
                      subtitle: Text("Islamabad F6"),
                    ),

                    SizedBox(height: SizeConfig.blockHeight * 4),

                    Row(
                      children: [
                        const Icon(Icons.calendar_month, size: 16),
                        const SizedBox(width: 4),
                        Text('date'),
                      ],
                    ),

                    const SizedBox(height: 4),

                    Row(
                      children: [
                        const Icon(Icons.watch_later_outlined, size: 16),
                        const SizedBox(width: 4),
                        Text("time and duration"),
                      ],
                    ),

                    const SizedBox(height: 14),

                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.horizontalLine),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text('Service Name'), Text('pkr 300')],
                          ),
                          SizedBox(height: 5),
                          Row(children: [Text('5 mint with Elize')]),
                        ],
                      ),
                    ),

                    const SizedBox(height: 14),
                  ],
                ),
              ),
            ),

            // ✅ Divider + Bottom Button
            Divider(height: 1, thickness: 1, color: AppColors.horizontalLine),
            Padding(
              padding: EdgeInsets.all(16),
              child: AppButtonTheme.iconTextButton(
                text: 'Confirm',
                icon: null,
                backgroundColor: AppColors.blackColor,
                textColor: AppColors.whiteColor,
                onPressed: () {
                  context.push(UserRoutesConstants.userPayment);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
