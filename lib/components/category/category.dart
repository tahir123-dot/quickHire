import 'package:flutter/material.dart';
import 'package:mobile/core/size_config/size_config.dart';

class Category extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final VoidCallback onTap;

  final double height;
  final double width;
  final Color backgroundColor;
  final Color borderColor;

  const Category({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.onTap,
    this.height = 90,
    this.width = double.infinity,
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        height: SizeConfig.blockHeight * 20,
        width: width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 18),

            // Text
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(description, style: const TextStyle(fontSize: 13)),
                ],
              ),
            ),


          ],
        ),

      ),
    );
  }
}
