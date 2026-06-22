import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/themes/app_button_theme.dart';
import 'package:mobile/core/themes/colors.dart';
import 'package:mobile/provider/bloc/blocimp/provider_bloc.dart';
import 'package:mobile/provider/bloc/event/provider_event.dart';
import 'package:mobile/provider/bloc/state/provider_state.dart';
import 'package:mobile/provider/data/dto/service_provider_dto.dart';
import 'package:mobile/provider/data/entity/availability_entity.dart';

class AddAvailabilityScreen extends StatefulWidget {
  const AddAvailabilityScreen({super.key});

  @override
  State<AddAvailabilityScreen> createState() => _AddAvailabilityScreenState();
}

class _AddAvailabilityScreenState extends State<AddAvailabilityScreen> {
  bool _isEditMode = false;
  static const _ownerId = '6a1e6abbb5759b02bac59cc1';

  @override
  void initState() {
    super.initState();
    context.read<ProviderBloc>().add(FetchAvailabilityEvent(ownerId: _ownerId));
  }

  void _populateFields(AvailabilityEntity availability) {
    setState(() {
      for (int i = 0; i < days.length; i++) {
        days[i]["selected"] = availability.days.contains(days[i]["key"]);
      }
      startTime = _to12Hour(availability.startTime);
      endTime = _to12Hour(availability.endTime);
      breakStartTime = _to12Hour(availability.breakStart ?? "");
      breakEndTime = _to12Hour(availability.breakEnd ?? "");
      selectedDurationIndex = durations.indexWhere(
        (d) => d["duration"] == availability.slotDuration.toString(),
      );
    });
  }

  // ✅ FIX — 00:00 handle kiya
  String _to12Hour(String time24) {
    if (time24.isEmpty) return "";
    if (time24 == "00:00") return ""; // ✅ backend se aane wali empty value
    final parts = time24.split(':');
    int hour = int.parse(parts[0]);
    final minute = parts[1];
    final period = hour >= 12 ? 'PM' : 'AM';
    if (hour > 12) hour -= 12;
    if (hour == 0) hour = 12;
    return '$hour:$minute $period';
  }

  String _to24Hour(String time12) {
    if (time12.isEmpty) return "";
    final parts = time12.split(' ');
    final timeParts = parts[0].split(':');
    int hour = int.parse(timeParts[0]);
    final minute = timeParts[1];
    final period = parts[1];
    if (period == 'PM' && hour != 12) hour += 12;
    if (period == 'AM' && hour == 12) hour = 0;
    return '${hour.toString().padLeft(2, '0')}:$minute';
  }

  // ===================== DAYS =====================
  List<Map<String, dynamic>> days = [
    {"name": "Monday", "key": "monday", "selected": false},
    {"name": "Tuesday", "key": "tuesday", "selected": false},
    {"name": "Wednesday", "key": "wednesday", "selected": false},
    {"name": "Thursday", "key": "thursday", "selected": false},
    {"name": "Friday", "key": "friday", "selected": false},
    {"name": "Saturday", "key": "saturday", "selected": false},
    {"name": "Sunday", "key": "sunday", "selected": false},
  ];

  void toggleDay(int index) {
    if (!_isEditMode) return;
    setState(() => days[index]["selected"] = !days[index]["selected"]);
  }

  // ===================== DURATIONS =====================
  List<Map<String, dynamic>> durations = [
    {"duration": "15"},
    {"duration": "30"},
    {"duration": "45"},
  ];

  int selectedDurationIndex = -1;

  void selectDuration(int index) {
    if (!_isEditMode) return;
    setState(() => selectedDurationIndex = index);
  }

  // ===================== TIMES =====================
  String startTime = "";
  String endTime = "";
  String breakStartTime = "";
  String breakEndTime = "";

  Future<void> pickTime({required bool isStart, bool isBreak = false}) async {
    if (!_isEditMode) return;
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (picked != null) {
      setState(() {
        final formatted = picked.format(context);
        if (isBreak) {
          if (isStart)
            breakStartTime = formatted;
          else
            breakEndTime = formatted;
        } else {
          if (isStart)
            startTime = formatted;
          else
            endTime = formatted;
        }
      });
    }
  }

  // ===================== SAVE =====================
  void _onSave(BuildContext context) {
    final selectedDays = days
        .where((d) => d["selected"] == true)
        .map((d) => d["key"] as String)
        .toList();

    if (selectedDays.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one day')),
      );
      return;
    }
    if (startTime.isEmpty || endTime.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select working hours')),
      );
      return;
    }
    if (selectedDurationIndex == -1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select slot duration')),
      );
      return;
    }

    final dto = AddAvailabilityDto(
      ownerId: _ownerId,
      ownerType: 'ServiceProvider',
      days: selectedDays,
      startTime: _to24Hour(startTime),
      endTime: _to24Hour(endTime),
      slotDuration: int.parse(durations[selectedDurationIndex]["duration"]!),
      breakStart: breakStartTime.isEmpty ? null : _to24Hour(breakStartTime),
      breakEnd: breakEndTime.isEmpty ? null : _to24Hour(breakEndTime),
    );

    context.read<ProviderBloc>().add(AddAvailabilityEvent(dto: dto));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProviderBloc, ProviderState>(
      listener: (context, state) {
        if (state is AvailabilityLoaded) {
          _populateFields(state.availability);
        }
        if (state is ProviderSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          setState(() => _isEditMode = false);
          context.read<ProviderBloc>().add(
            FetchAvailabilityEvent(ownerId: _ownerId),
          );
        }
        if (state is ProviderError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          surfaceTintColor: AppColors.transparentBackground,
          elevation: 3,
          shadowColor: AppColors.blackColor.withValues(alpha: 0.2),
          title: const Text('Availability'),
          actions: [
            if (!_isEditMode)
              IconButton(
                onPressed: () => setState(() => _isEditMode = true),
                icon: const Icon(Icons.edit_outlined),
                tooltip: 'Edit Availability',
              ),
            if (_isEditMode)
              IconButton(
                onPressed: () => setState(() => _isEditMode = false),
                icon: const Icon(Icons.close),
                tooltip: 'Cancel',
              ),
          ],
        ),

        // ✅ FIX — loading state body mein
        body: SafeArea(
          child: BlocBuilder<ProviderBloc, ProviderState>(
            builder: (context, state) {
              // ✅ pehli baar loading - centered loader
              if (state is ProviderLoading) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(
                        color: AppColors.blackColor,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Loading availability...',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                );
              }

              // ✅ error state
              if (state is ProviderError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.wifi_off_rounded,
                        size: 52,
                        color: Colors.grey.shade300,
                      ),
                      SizedBox(height: 14.h),
                      Text(
                        'Failed to load availability',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        'Please check your connection',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      GestureDetector(
                        onTap: () => context.read<ProviderBloc>().add(
                          FetchAvailabilityEvent(ownerId: _ownerId),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 12.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.blackColor,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.refresh,
                                color: Colors.white,
                                size: 18,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Try Again',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }

              // ✅ data loaded ya initial - form dikhao
              return ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 31.w),
                children: [
                  SizedBox(height: 46.h),

                  // edit mode banner
                  if (_isEditMode)
                    Container(
                      margin: EdgeInsets.only(bottom: 20.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.blackColor.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: AppColors.blackColor.withValues(alpha: 0.1),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.edit_outlined, size: 16),
                          SizedBox(width: 8.w),
                          Text(
                            'Edit mode — make your changes and save',
                            style: TextStyle(fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ),

                  // ===================== DAYS =====================
                  Text(
                    'Select Working Days',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 13.h),
                  const Text('Choose the days you are available to work'),
                  SizedBox(height: 26.h),
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
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 13.h),
                  const Text('Set the time range for your working hours'),
                  SizedBox(height: 26.h),
                  Row(
                    children: [
                      Expanded(
                        child: _timeBox(
                          label: "Start Time",
                          time: startTime,
                          onTap: () => pickTime(isStart: true),
                          isEditMode: _isEditMode,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _timeBox(
                          label: "End Time",
                          time: endTime,
                          onTap: () => pickTime(isStart: false),
                          isEditMode: _isEditMode,
                        ),
                      ),
                    ],
                  ),

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
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
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

                  // ===================== BREAK TIME =====================
                  Text(
                    'Add Break Time',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 13.h),
                  const Text('Add break time if you want to block some time'),
                  SizedBox(height: 26.h),
                  Row(
                    children: [
                      Expanded(
                        child: _timeBox(
                          label: "Break Start",
                          time: breakStartTime,
                          onTap: () => pickTime(isStart: true, isBreak: true),
                          isEditMode: _isEditMode,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _timeBox(
                          label: "Break End",
                          time: breakEndTime,
                          onTap: () => pickTime(isStart: false, isBreak: true),
                          isEditMode: _isEditMode,
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

                  // ===================== SAVE BUTTON =====================
                  if (_isEditMode)
                    AppButtonTheme.iconTextButton(
                      text: 'Save Availability',
                      icon: null,
                      backgroundColor: AppColors.blackColor,
                      textColor: AppColors.whiteColor,
                      onPressed: () => _onSave(context),
                    ),

                  SizedBox(height: 20.h),
                ],
              );
            },
          ),
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
          color: isSelected
              ? AppColors.listBackground
              : _isEditMode
              ? Colors.white
              : Colors.grey.shade50,
          border: Border.all(
            color: isSelected
                ? AppColors.listBackground
                : _isEditMode
                ? AppColors.blackColor
                : Colors.grey.shade300,
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
                color: isSelected
                    ? Colors.white
                    : _isEditMode
                    ? Colors.black
                    : Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 4.h),
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? Colors.white
                      : _isEditMode
                      ? Colors.black
                      : Colors.grey.shade400,
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
          color: isSelected
              ? AppColors.listBackground
              : _isEditMode
              ? Colors.white
              : Colors.grey.shade50,
          border: Border.all(
            color: isSelected
                ? AppColors.listBackground
                : _isEditMode
                ? AppColors.blackColor
                : Colors.grey.shade300,
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
                color: isSelected
                    ? Colors.white
                    : _isEditMode
                    ? Colors.black
                    : Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              "min",
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : _isEditMode
                    ? Colors.black
                    : Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ===================== TIME BOX WIDGET =====================
Widget _timeBox({
  required String label,
  required String time,
  required VoidCallback onTap,
  bool isEditMode = false,
}) {
  return GestureDetector(
    onTap: isEditMode ? onTap : null,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isEditMode ? Colors.white : Colors.grey.shade50,
        border: Border.all(
          color: isEditMode ? Colors.black : Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: isEditMode ? Colors.black : Colors.grey.shade500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            time.isEmpty ? "Select Time" : time,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isEditMode
                  ? Colors.black
                  : time.isEmpty
                  ? Colors.grey.shade400
                  : Colors.grey.shade600,
            ),
          ),
        ],
      ),
    ),
  );
}
