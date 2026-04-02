import 'package:flutter/material.dart';
import 'package:mobile/core/themes/colors.dart';

class CustomerReviews extends StatelessWidget {
  const CustomerReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              // Fixed Avatar
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage("assets/images/user.png"),
              ),
              SizedBox(width: 12),
              // Text Column
              Expanded(

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name and rating
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tahir',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: AppColors.yellowRating,
                              size: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3),
                    // Location
                    Text(
                      'Islamabad F6',
                      style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
            'Pellentesque euismod, nisi vel consectetur euismod, nisl nisi consectetur nisi, '
            'eget consectetur nisl nisi eget nisl.',
            style: TextStyle(fontSize: 13, color: Colors.grey[800]),
          ),
          SizedBox(height: 20),
          Divider(height: 1, thickness: 1, color: AppColors.horizontalLine),
          SizedBox(height: 17),
        ],
      ),
    );
  }
}
