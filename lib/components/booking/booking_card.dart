import 'package:flutter/material.dart';
import '../../core/themes/colors.dart';
import '../service_offer/service_list.dart';

class BookingCard extends StatelessWidget {
  final String date;
  final String time;
  final String duration;
  final double rating;
  final int ratingCount;
  final int experienceYears;
  final int clientCount;

  BookingCard({
    super.key,
    required this.date,
    required this.time,
    required this.duration,
    required this.rating,
    required this.ratingCount,
    required this.experienceYears,
    required this.clientCount,
  });

  final services = [
    'Haircut',
    'Shave',
    'Massage',
    'Facial',
    'Facial',
    'Facial',
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.searchBarBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Column(
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
                const SizedBox(height: 3),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: List.generate(
                services.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: ServiceList(serviceName: services[index]),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 6),
                Text("Pkr 300", style: TextStyle(fontWeight: FontWeight.bold)),

                const SizedBox(height: 12),
                const Divider(height: 1, color: AppColors.horizontalLine),

                const SizedBox(height: 12),
                // ✅ Rating / Experience / Clients
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: AppColors.darkBlueColor,
                        ),
                        const SizedBox(width: 4),
                        Text("$rating ($ratingCount)"),
                      ],
                    ),
                    Container(
                      height: 20,
                      width: 1,
                      color: AppColors.horizontalLine,
                    ),
                    Text("$experienceYears Years Experience"),
                    Container(
                      height: 20,
                      width: 1,
                      color: AppColors.horizontalLine,
                    ),
                    Text("$clientCount+ Clients"),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 12,)
        ],
      ),
    );
  }
}
