import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../components/button/custom_switch_tile.dart';

class AvailabilityComponent extends StatelessWidget {
  final DateTime focusedDay;
  final Function(DateTime, DateTime) onDaySelected;

  const AvailabilityComponent({
    super.key,
    required this.focusedDay,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Calendar
        TableCalendar(
          firstDay: today,
          lastDay: today.add(const Duration(days: 365)),
          focusedDay: focusedDay,
          calendarFormat: CalendarFormat.month,
          onDaySelected: onDaySelected,
          onFormatChanged: (format) {},
          onPageChanged: (focusedDay) {},
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
              Color bgColor = day.isBefore(today) ? Colors.grey.shade300 : Colors.white;

              return Container(
                margin: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: Text('${day.day}'),
              );
            },
          ),
        ),

        const SizedBox(height: 20),

        // Weekday Switches
        Column(
          children: List.generate(7, (index) {
            int weekday = index + 1;

            return CustomSwitchTile(
              title: weekdayName(weekday),
              value: false,
              onChanged: (val) {},
            );
          }),
        ),
      ],
    );
  }

  String weekdayName(int weekday) {
    switch (weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }
}