import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:igreja/src/themes/theme_colors.dart';

class MonthCalendarComponent extends StatelessWidget {
  const MonthCalendarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final List weekDay = [
      'Seg',
      'Ter',
      'Qua',
      'Qui',
      'Sex',
      'Sab',
      'Dom',
    ];
    return Container(
      height: MediaQuery.of(context).size.height - 130,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white),
      child: MonthView(
        cellBuilder: (date, event, isToday, isInMonth, isSelected) {
          return InkWell(
            onTap: () {
              print(event);
              print(date);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: isInMonth ? Colors.white : Colors.grey[200]),
              child: Column(
                children: [
                  isToday
                      ? CircleAvatar(
                          backgroundColor: ThemeColors.blueV,
                          child: Text(
                            date.day.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
                      : Text(date.day.toString()),
                ],
              ),
            ),
          );
        },
        cellAspectRatio: 1.8,
        startDay: WeekDays.monday,
        weekDayStringBuilder: (p0) {
          return '${weekDay[p0]}';
        },
        headerStyle: const HeaderStyle(
          headerTextStyle: TextStyle(color: Colors.white),
          rightIcon: Icon(
            Icons.chevron_right_rounded,
            color: Colors.white,
          ),
          leftIcon: Icon(
            Icons.chevron_left_rounded,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            color: ThemeColors.blueTheme,
          ),
        ),
      ),
    );
  }
}
