import 'package:flutter/material.dart';

class CategoryInfoScreen extends StatefulWidget {
  const CategoryInfoScreen({super.key});

  @override
  State<CategoryInfoScreen> createState() => _CategoryInfoScreenState();
}

class _CategoryInfoScreenState extends State<CategoryInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Category info screen'),
      ),
    );
  }
}
