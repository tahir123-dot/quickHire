import 'package:flutter/material.dart';
import '../themes/colors.dart';

class BottomNavigation extends StatelessWidget {
  final List<IconData> icons;
  final int currentIndex;
  final Function(int) onTap;
  final List<String>? labels; // optional

  const BottomNavigation({
    super.key,
    required this.icons,
    required this.onTap,
    required this.currentIndex,
    this.labels,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: labels != null ? 68 : 60, // label ho to thoda bada
      decoration: BoxDecoration(
        color: AppColors.transparentBackground,
        borderRadius: BorderRadius.circular(0),
        border: Border.all(color: AppColors.searchBarBackground, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (index) {
          final isActive = index == currentIndex;

          return GestureDetector(
            onTap: () => onTap(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isActive
                    ? AppColors.transparentBackground
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icons[index],
                    size: isActive ? 26 : 24,
                    color: isActive
                        ? AppColors.listBackground
                        : AppColors.textSecondary,
                  ),
                  if (labels != null) ...[
                    const SizedBox(height: 3),
                    Text(
                      labels![index],
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: isActive
                            ? FontWeight.w500
                            : FontWeight.w400,
                        color: isActive
                            ? AppColors.listBackground
                            : AppColors.textSecondary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
