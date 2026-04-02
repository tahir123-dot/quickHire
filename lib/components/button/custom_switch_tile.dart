import 'package:flutter/material.dart';
import 'package:mobile/core/themes/colors.dart';

class CustomSwitchTile extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool) onChanged;

  const CustomSwitchTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        SwitchListTile(
          title: Text(title),
          subtitle: Text(value ? "Available" : "Closed"),
          value: value,
          onChanged: onChanged,
          inactiveThumbColor: AppColors.searchBarBackground,
          activeTrackColor: AppColors.toggleColor,
        ),

        Row(
          children: [
            Expanded(
              child: DropdownMenu<String>(
                menuHeight: 250,

                label: Text('Start Date'),

                trailingIcon: Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.toggleColor,
                ),

                textStyle: TextStyle(fontSize: 14, color: Colors.black),

                menuStyle: MenuStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                  elevation: WidgetStatePropertyAll(5),
                ),

                inputDecorationTheme: InputDecorationTheme(
                  filled: false,
                  fillColor: AppColors.searchBarBackground,

                  contentPadding: EdgeInsets.symmetric(horizontal: 10),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.searchBarBackground,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.searchBarBackground,
                      width: 2,
                    ),
                  ),
                ),

                dropdownMenuEntries: List.generate(
                  15,
                      (index) => DropdownMenuEntry(
                    value: String.fromCharCode(65 + index), // A → O
                    label: String.fromCharCode(65 + index),
                  ),
                ),

                onSelected: (value) {},
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: DropdownMenu<String>(
                menuHeight: 250,

                label: Text('Start Date'),

                trailingIcon: Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.toggleColor,
                ),

                textStyle: TextStyle(fontSize: 14, color: Colors.black),

                menuStyle: MenuStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                  elevation: WidgetStatePropertyAll(5),
                ),

                inputDecorationTheme: InputDecorationTheme(
                  filled: false,
                  fillColor: AppColors.searchBarBackground,

                  contentPadding: EdgeInsets.symmetric(horizontal: 10),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.searchBarBackground,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.searchBarBackground,
                      width: 2,
                    ),
                  ),
                ),

                dropdownMenuEntries: List.generate(
                  15,
                      (index) => DropdownMenuEntry(
                    value: String.fromCharCode(65 + index), // A → O
                    label: String.fromCharCode(65 + index),
                  ),
                ),

                onSelected: (value) {},
              ),
            ),
          ],
        ),
        SizedBox(height: 15,),
        Divider(height: 1, thickness: 1, color: AppColors.horizontalLine,),
        SizedBox(height: 15,),
      ]
    );
  }
}
