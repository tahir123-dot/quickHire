import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/components/top_bar_widget/top_bar_widget.dart';
import 'package:mobile/core/themes/app_button_theme.dart';
import 'package:mobile/core/themes/colors.dart';

class AddAvailabilityScreen extends StatefulWidget {
  const AddAvailabilityScreen({super.key});

  @override
  State<AddAvailabilityScreen> createState() => _AddAvailabilityScreenState();
}

class _AddAvailabilityScreenState extends State<AddAvailabilityScreen> {
  // ===================== DAYS =====================
  List<Map<String, dynamic>> days = [
    {"name": "Monday", "selected": false},
    {"name": "Tuesday", "selected": true},
    {"name": "Wednesday", "selected": false},
    {"name": "Thursday", "selected": false},
    {"name": "Friday", "selected": false},
    {"name": "Saturday", "selected": false},
    {"name": "Sunday", "selected": false},
  ];

  void toggleDay(int index) {
    setState(() {
      days[index]["selected"] = !days[index]["selected"];
    });
  }

  // ===================== DURATIONS =====================
  List<Map<String, dynamic>> durations = [
    {"duration": "15", "selected": false},
    {"duration": "30", "selected": false},
    {"duration": "45", "selected": false},
  ];

  int selectedDurationIndex = -1; // ⭐ optimized state

  void selectDuration(int index) {
    setState(() {
      selectedDurationIndex = index;
    });
  }

  // ===================== BACKEND =====================
  void sendToBackend() {
    final result = {
      "days": days,
      "duration": durations[selectedDurationIndex]["duration"],
    };

    print(result);
  }

  // function
  String startTime = "";
  String endTime = "";

  Future<void> pickTime({required bool isStart}) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),

      // 👇 THIS IS THE FIX jani
      initialEntryMode: TimePickerEntryMode.dial,
    );

    if (picked != null) {
      setState(() {
        final formatted = picked.format(context);

        if (isStart) {
          startTime = formatted;
        } else {
          endTime = formatted;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.transparentBackground,
        elevation: 3,
        shadowColor: AppColors.blackColor.withValues(alpha: 0.2),
        title: TopBarIconWithCenterText(pageName: 'Availability'),
      ),

      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 31.w),
          children: [
            SizedBox(height: 46.h),

            // ===================== DAYS TITLE =====================
            Text(
              'Select Working Days',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 13.h),
            const Text('Choose the days you are available to work'),

            SizedBox(height: 26.h),

            // ===================== DAYS UI =====================
            Wrap(
              spacing: 15,
              runSpacing: 10,
              children: List.generate(days.length, (index) {
                final day = days[index];
                final isSelected = day["selected"];

                return _buildDayItem(day, isSelected, index);
              }),
            ),

            SizedBox(height: 23.h),
            Divider(
              thickness: 1,
              height: 1,
              color: AppColors.lightHorizontalLine,
            ),
            SizedBox(height: 23.h),

            // ===================== WORKING HOURS =====================
            Text(
              'Select Working Hours',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 13.h),
            const Text('Set the time range for your working hours'),

            SizedBox(height: 23.h),
            Divider(
              thickness: 1,
              height: 1,
              color: AppColors.lightHorizontalLine,
            ),
            SizedBox(height: 23.h),

            // ===================== SLOT DURATION =====================
            Text(
              'Select Slot Duration',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 13.h),
            const Text('Choose the duration of each booking slot'),

            SizedBox(height: 26.h),

            Wrap(
              spacing: 15,
              runSpacing: 10,
              children: List.generate(durations.length, (index) {
                final item = durations[index];
                final isSelected = selectedDurationIndex == index;

                return _buildDurationItem(item, isSelected, index);
              }),
            ),

            SizedBox(height: 23.h),
            Divider(
              thickness: 1,
              height: 1,
              color: AppColors.lightHorizontalLine,
            ),
            SizedBox(height: 23.h),

            // ===================== Break Time =====================
            Text(
              'Add Break Time',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 13.h),
            const Text('Add break time if you want to block some time'),

            SizedBox(height: 26.h),
            Row(
              children: [
                Expanded(
                  child: _timeBox(
                    label: "Start Time",
                    time: startTime,
                    onTap: () => pickTime(isStart: true),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _timeBox(
                    label: "End Time",
                    time: endTime,
                    onTap: () => pickTime(isStart: false),
                  ),
                ),
              ],
            ),
            SizedBox(height: 26.h),
            Divider(
              thickness: 1,
              height: 1,
              color: AppColors.lightHorizontalLine,
            ),
            SizedBox(height: 23.h),

            // select time zone
            // ===================== Time Zone Select =====================
            Text(
              'Select Time Zone',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 13.h),
            const Text('Add Time Zone for better bookings'),

            SizedBox(height: 26.h),

            // Time Zone Click
            Container(
              width: double.infinity,
              height: 68.h,
              decoration: BoxDecoration(
                color: AppColors.listBackground,
                border: Border.all(color: AppColors.listBackground),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: Text(
                  "Select Time Zone ",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.whiteColor,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 25.r,
                  color: AppColors.whiteColor,
                ),
                onTap: () {
                  print("Time zone screen ");
                },
              ),
            ),

            SizedBox(height: 26.h),

            Divider(
              thickness: 1,
              height: 1,
              color: AppColors.lightHorizontalLine,
            ),
            SizedBox(height: 23.h),

            // Save Availability button
            AppButtonTheme.iconTextButton(
              text: 'Save Availability',
              icon: null,
              backgroundColor: AppColors.blackColor,
              textColor: AppColors.whiteColor,
              onPressed: () {
                print("Confirm save");
              },
            ),
          ],
        ),
      ),
    );
  }

  // ===================== WIDGET: DAY ITEM =====================
  Widget _buildDayItem(Map day, bool isSelected, int index) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => toggleDay(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 84,
        height: 84,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.listBackground : Colors.white,
          border: Border.all(
            color: isSelected ? AppColors.listBackground : AppColors.blackColor,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day["name"].substring(0, 3),
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 4.h),
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.white : Colors.black,
                ),
                color: isSelected ? Colors.white : Colors.transparent,
              ),
              child: isSelected
                  ? Icon(Icons.check, size: 12, color: AppColors.listBackground)
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  // ===================== WIDGET: DURATION ITEM =====================
  Widget _buildDurationItem(Map item, bool isSelected, int index) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => selectDuration(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 84,
        height: 84,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.listBackground : Colors.white,
          border: Border.all(
            color: isSelected ? AppColors.listBackground : AppColors.blackColor,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item["duration"],
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              "min",
              style: TextStyle(color: isSelected ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

///
///
///
Widget _timeBox({
  required String label,
  required String time,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(label),
          SizedBox(height: 8),
          Text(time.isEmpty ? "Select Time" : time),
        ],
      ),
    ),
  );
}
