import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:rendez/components/calendar_data.dart' as calenderData;

class Calendar extends StatefulWidget {
  Calendar({required this.collectionReference});
  CollectionReference collectionReference;
  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SfCalendarTheme(
              data: SfCalendarThemeData(todayHighlightColor: Color(0xFF9E51DA)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SfCalendar(
                  view: CalendarView.month,
                  headerStyle: CalendarHeaderStyle(textAlign: TextAlign.center),
                  headerDateFormat: 'MMMM y',
                  cellBorderColor: Colors.white,
                  showNavigationArrow: true,
                  // showDatePickerButton: true,
                  initialSelectedDate: DateTime.now(),
                  dataSource: calenderData.getCalendarDataSource(),
                  firstDayOfWeek: 1,
                  monthViewSettings: MonthViewSettings(
                    showTrailingAndLeadingDates: false,
                    dayFormat: 'EEE',
                    showAgenda: true,
                    agendaViewHeight: 280,
                    agendaItemHeight: 80,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
