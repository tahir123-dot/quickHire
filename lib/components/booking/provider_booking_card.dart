import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/routes/provider_routes/provider_routes_constants.dart';
import '../../core/themes/colors.dart';

class ProviderBookingCard extends StatelessWidget {
  final String date;
  final String time;
  final String duration;

  const ProviderBookingCard({
    super.key,
    required this.date,
    required this.time,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(ProviderRoutesConstants.providerBookingDetails);
      },
      child: Card(
        elevation: 0,
        margin: EdgeInsets.all(0),
        color: AppColors.searchBarBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ✅ User info + Cancel button
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
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blackColor,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        fixedSize: Size(100, 10),
                      ),
                      onPressed: () {
                        print('booking cancel');
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: AppColors.whiteColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 6),

                  // user earning and total bookings counts
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: AppColors.transparentBackground,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '400k',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text('Total Earning'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: AppColors.transparentBackground,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '400k',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text('Total Earning'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: AppColors.transparentBackground,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '400k',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text('Total Earning'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),

                  // ✅ Date and Time info
                  Row(
                    children: [
                      const Icon(Icons.calendar_month, size: 16),
                      const SizedBox(width: 4),
                      Text(date),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.watch_later_outlined, size: 16),
                      const SizedBox(width: 4),
                      Text("$time ($duration)"),
                    ],
                  ),

                  const SizedBox(height: 6),
                  const Divider(height: 1, color: AppColors.horizontalLine),
                  const SizedBox(height: 8),

                  Text(
                    "Pkr 300",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
