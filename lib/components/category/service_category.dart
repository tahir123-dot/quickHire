import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServiceCategory extends StatelessWidget {
  final String title;
  final IconData? icon;
  final String route;

  const ServiceCategory({super.key, required this.title, this.icon, required this.route});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: (){
        context.push(route);
      },
      child: Container(
        width: 80,
        height: 80,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.black),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(icon),SizedBox(height: 10,),Text(title,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),)]

        ),
      ),
    );
  }
}
