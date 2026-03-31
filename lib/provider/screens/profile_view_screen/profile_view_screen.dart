import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/routes/shared_routes/shared_routes_constant.dart';

import '../../../routes/provider_routes/provider_routes_constants.dart';

class ProfileViewScreen extends StatefulWidget {
  const ProfileViewScreen({super.key});

  @override
  State<ProfileViewScreen> createState() => _ProfileViewScreenState();
}

class _ProfileViewScreenState extends State<ProfileViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('Profile view screen'),
          ),
          ElevatedButton(onPressed: (){
            context.push(ProviderRoutesConstants.providerEditProfile);
          }, child: Text('Edit Profile Screen')),
          ElevatedButton(onPressed: (){
            context.push(ProviderRoutesConstants.providerCustomerReview);
          }, child: Text('customer Review Screen')),
          ElevatedButton(onPressed: (){
            context.push(SharedRoutesConstant.settingScreen);
          }, child: Text('Setting screen')),
        ],
      ),
    );
  }
}
