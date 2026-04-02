import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../components/button/custom_switch_tile.dart';

class AddAvailabilityScreen extends StatefulWidget {
  const AddAvailabilityScreen({super.key});

  @override
  State<AddAvailabilityScreen> createState() => _AddAvailabilityScreenState();
}

class _AddAvailabilityScreenState extends State<AddAvailabilityScreen> {
  DateTime _focusedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  // ✅ Use ValueNotifier for instant UI updates
  final ValueNotifier<Map<DateTime, bool>> availabilityNotifier = ValueNotifier(
    {},
  );
  final ValueNotifier<Map<int, bool>> weekdaysNotifier = ValueNotifier({
    1: false,
    2: false,
    3: false,
    4: false,
    5: false,
    6: false,
    7: false,
  });

  @override
  void dispose() {
    availabilityNotifier.dispose();
    weekdaysNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Date and Time')),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ===== Table Calendar =====
              ValueListenableBuilder<Map<DateTime, bool>>(
                valueListenable: availabilityNotifier,
                builder: (context, availability, _) {
                  return TableCalendar(
                    firstDay: DateTime.now(),
                    lastDay: DateTime.now().add(const Duration(days: 365)),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    onFormatChanged: (format) {
                      setState(() => _calendarFormat = format);
                    },
                    onPageChanged: (focusedDay) => _focusedDay = focusedDay,
                    enabledDayPredicate: (day) => !day.isBefore(DateTime.now()),

                    // ✅ Handle day tap → toggle availability
                    onDaySelected: (selectedDay, focusedDay) {
                      if (selectedDay.isBefore(DateTime.now())) return;

                      final current = availability[selectedDay] ?? false;
                      final newAvailability = Map<DateTime, bool>.from(
                        availability,
                      );
                      newAvailability[selectedDay] = !current;
                      availabilityNotifier.value = newAvailability;

                      // Update corresponding weekday
                      final weekdayMap = Map<int, bool>.from(
                        weekdaysNotifier.value,
                      );
                      weekdayMap[selectedDay.weekday] =
                          newAvailability[selectedDay]!;
                      weekdaysNotifier.value = weekdayMap;

                      _focusedDay = focusedDay;
                    },

                    // ✅ Highlight selected / on/off dates
                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, day, focusedDay) {
                        bool? isOn = availability[day];
                        Color bgColor;

                        if (day.isBefore(DateTime.now())) {
                          bgColor = Colors.grey.shade300;
                        } else if (isOn == true) {
                          bgColor = Colors.green.shade300;
                        } else if (isOn == false) {
                          bgColor = Colors.red.shade200;
                        } else {
                          bgColor = Colors.white;
                        }

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
                  );
                },
              ),

              const SizedBox(height: 20),

              // ===== Weekday Switches =====
              ValueListenableBuilder<Map<int, bool>>(
                valueListenable: weekdaysNotifier,
                builder: (context, weekdays, _) {
                  return Column(
                    children: weekdays.entries.map((entry) {
                      return CustomSwitchTile(
                        title: weekdayName(entry.key),
                        value: entry.value,
                        onChanged: (val) {
                          // ✅ Only update necessary parts
                          final newWeekdays = Map<int, bool>.from(weekdays);
                          newWeekdays[entry.key] = val;
                          weekdaysNotifier.value = newWeekdays;

                          final newAvailability = Map<DateTime, bool>.from(
                            availabilityNotifier.value,
                          );
                          newAvailability.updateAll(
                            (key, value) =>
                                key.weekday == entry.key ? val : value,
                          );
                          availabilityNotifier.value = newAvailability;
                        },
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper: weekday number → name
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
