import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/core/themes/colors.dart';

class ServiceCard extends StatelessWidget {
  final String serviceName;
  final String time;
  final String price;
  final VoidCallback? onDelete;

  const ServiceCard({
    super.key,
    required this.serviceName,
    required this.price,
    this.onDelete,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // service Name and delete icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                serviceName,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              InkWell(
                onTap: onDelete,
                child: SvgPicture.asset(
                  "assets/icons/delete.svg",
                  width: 18,
                  height: 18,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          // service Time
          Text(time),
          SizedBox(height: 8),
          // Service Price
          Text("from Rs: $price"),

          SizedBox(height: 25),
          Divider(height: 1, thickness: 1, color: AppColors.horizontalLine),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

// Service Card Toggle

class ServiceCardToggle extends StatefulWidget {
  final String serviceName;
  final String time;
  final String price;

  const ServiceCardToggle({
    super.key,
    required this.serviceName,
    required this.price,
    required this.time,
  });

  @override
  State<ServiceCardToggle> createState() => _ServiceCardToggleState();
}

class _ServiceCardToggleState extends State<ServiceCardToggle> {
  bool isChanged = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        onTap: () {
          setState(() {
            isChanged = !isChanged;
          });
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // service Name and delete icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.serviceName,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.transparentBackground,
                    border: Border.all(
                      color: isChanged
                          ? AppColors.blueColor
                          : AppColors.blackColor,
                      width: 1.5,
                    ),
                  ),
                  child: Center(
                    child: isChanged
                        ? Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.blueColor,
                            ),
                          )
                        : null,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            // service Time
            Text(widget.time),
            SizedBox(height: 8),
            // Service Price
            Text("from Rs: ${widget.price}"),

            SizedBox(height: 25),
            Divider(height: 1, thickness: 1, color: AppColors.horizontalLine),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
