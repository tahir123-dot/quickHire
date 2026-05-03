import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/navigation/circle_button.dart';
import 'package:mobile/core/themes/colors.dart';
import 'package:mobile/routes/provider_routes/provider_routes_constants.dart';
import '../../routes/shared_routes/shared_routes_constant.dart';

// in this we have user name , avatar image, notification , setting icon
class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/images/user.png"),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Morning!', style: TextStyle(fontSize: 10)),

                Text('Hi, Tahir', style: TextStyle(fontSize: 17)),
              ],
            ),
          ],
        ),
        Row(
          children: [
            InkWell(
              child: SvgPicture.asset("assets/icons/notification.svg"),
              onTap: () {
                context.push(SharedRoutesConstant.notificationScreen);
              },
            ),
            SizedBox(width: 12),
            InkWell(
              child: SvgPicture.asset("assets/icons/setting.svg"),
              onTap: () {
                context.push(SharedRoutesConstant.settingScreen);
              },
            ),
          ],
        ),
      ],
    );
  }
}

// In this we have a space between left side text and right side icons
class TopBarMinimal extends StatelessWidget {
  final String pageName;
  const TopBarMinimal({super.key, required this.pageName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(pageName, style: TextStyle(fontSize: 19)),
        Row(
          children: [
            InkWell(
              child: SvgPicture.asset("assets/icons/notification.svg"),
              onTap: () {
                context.push(SharedRoutesConstant.notificationScreen);
              },
            ),
            SizedBox(width: 12),
            InkWell(
              child: SvgPicture.asset("assets/icons/setting.svg"),
              onTap: () {
                context.push(SharedRoutesConstant.settingScreen);
              },
            ),
          ],
        ),
      ],
    );
  }
}

// In this left side back button  and in center Text and right side nothing
class TopBarIconWithCenterText extends StatelessWidget {
  final String pageName;

  const TopBarIconWithCenterText({super.key, required this.pageName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        alignment: Alignment.center,
        children: [
          /// Left Icon
          Align(
            alignment: Alignment.centerLeft,
            child: CircleButton(
              icon: Icons.arrow_back_ios_rounded,
              backgroundColor: AppColors.searchBarBackground,
              iconColor: AppColors.blackColor,
            ),
          ),

          /// Center Text
          Center(
            child: Text(
              pageName,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}

// in this we have three things icon, center text and action button
class TopBarThreeThings extends StatelessWidget {
  final String pageName;
  final String imagePath;
  final bool isMenu;

  const TopBarThreeThings({
    super.key,
    required this.pageName,
    required this.imagePath,
    this.isMenu = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleButton(
          icon: Icons.arrow_back_ios_rounded,
          backgroundColor: AppColors.searchBarBackground,
          iconColor: AppColors.blackColor,
        ),

        Text(
          pageName,
          style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w400),
        ),

        isMenu
            ? PopupMenuButton<String>(
                icon: SvgPicture.asset(imagePath),

                // ✅ Menu ko neeche shift karna
                offset: const Offset(0, 40),

                // ✅ Smooth animation
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),

                onSelected: (value) {
                  if (value == 'edit') {
                   context.push(ProviderRoutesConstants.providerEditProfile);
                  } else if (value == 'delete') {
                    print('Delete clicked');
                  }
                },

                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'edit',
                    child: Row(
                      children: const [
                        Icon(Icons.edit, size: 18),
                        SizedBox(width: 10),
                        Text('Edit'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: const [
                        Icon(Icons.delete, size: 18),
                        SizedBox(width: 10),
                        Text('Delete'),
                      ],
                    ),
                  ),
                ],
              )
            : InkWell(
                child: SvgPicture.asset(imagePath),
                onTap: () {
                  isMenu? null:context.push(ProviderRoutesConstants.providerPayment);
                },
              ),
      ],
    );
  }
}

// Provider Top Bar below username picture location

class ProviderTopBarWidget extends StatelessWidget {
  final String providerName;
  final String location;
  final IconData? icon;
  const ProviderTopBarWidget({
    super.key,
    required this.providerName,
    required this.location,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/images/user.png"),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(providerName, style: TextStyle(fontSize: 17)),

                    Text(location, style: TextStyle(fontSize: 10)),
                  ],
                ),
              ],
            ),
            if (icon != null)
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: AppColors.purpleLight, // background color
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(6), // circle shape
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(icon, color: AppColors.purpleDark), // icon color
                    iconSize: 20,
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 20),
        SizedBox(
          child: Row(
            children: [
              Icon(Icons.star, color: AppColors.yellowRating, size: 14),
              Text(' 4.3 (355)', style: TextStyle(fontSize: 13)),
            ],
          ),
        ),
        SizedBox(height: 15),
        Divider(height: 1, thickness: 1, color: AppColors.horizontalLine),
      ],
    );
  }
}
