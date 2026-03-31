import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/routes/provider_routes/provider_routes_constants.dart';
import 'package:mobile/routes/shared_routes/shared_routes_constant.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('edit profile screen'),
          ),
          ElevatedButton(onPressed: (){
            // idr screen ly ky ani ha payment wali
          }, child: Text('Add Payment Screen')),
          ElevatedButton(onPressed: (){
            context.push(ProviderRoutesConstants.providerProfileView);
          }, child: Text('View Profile')),
          ElevatedButton(onPressed: (){
            context.push(SharedRoutesConstant.addressScreen);
          }, child: Text('Address screen')),
          ElevatedButton(onPressed: (){
            context.push(ProviderRoutesConstants.providerAddAvailability);
          }, child: Text('Add Availability Screen')),
          ElevatedButton(onPressed: (){
            context.push(ProviderRoutesConstants.providerAddTeam);
          }, child: Text('Add Team member Screen')),
          ElevatedButton(onPressed: (){
            context.push(ProviderRoutesConstants.providerTeamList);
          }, child: Text('Team List Screen'))
        ],
      ),
    );
  }
}
