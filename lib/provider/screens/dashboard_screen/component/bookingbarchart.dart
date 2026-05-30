import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/provider/screens/dashboard_screen/component/fakedata/bookingbardata.dart';

class BookingBarChart extends StatelessWidget {
  final List<BookingBarData> data;
  final int highlightIndex; // today ka index — purple dark

  const BookingBarChart({
    super.key,
    required this.data,
    this.highlightIndex = 4, // default Friday
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: Colors.grey.withValues(alpha: 0.15),
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Booking in week',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              Text(
                'Mon–Sun',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Bar Chart
          SizedBox(
            height: 130,
            child: BarChart(
              BarChartData(
                maxY: 12, // max value — apne data ke hisaab se
                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        '${rod.toY.toInt()} bookings',
                        const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  // Sirf bottom titles — day names
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index < 0 || index >= data.length) {
                          return const SizedBox();
                        }
                        return Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            data[index].day,
                            style: TextStyle(
                              fontSize: 11,
                              color: index == highlightIndex
                                  ? const Color(0xFF534AB7)
                                  : Colors.grey,
                              fontWeight: index == highlightIndex
                                  ? FontWeight.w500
                                  : FontWeight.w400,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Baaki sab hide
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                // Grid aur border hide
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false),

                // Bars
                barGroups: List.generate(data.length, (index) {
                  final isHighlight = index == highlightIndex;
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: data[index].bookings,
                        width: 28,
                        borderRadius: BorderRadius.circular(6),
                        // highlight bar dark purple, baaki light purple
                        color: isHighlight
                            ? const Color(0xFF534AB7)
                            : const Color(0xFFEEEDFE),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
