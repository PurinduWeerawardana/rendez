import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class calendarData extends CalendarDataSource {
  calendarData(List source) {
    appointments = source;
  }
}

Future getDocs() async {
  final appointmentsQuery =
      await FirebaseFirestore.instance.collection("appointments").get();
  for (var appointment in appointmentsQuery.docs) {
    print(appointment["subject"]);
    print(appointment["end_time"].toDate());
    print(DateTime.now());
  }
}

calendarData getCalendarDataSource() {
  List appointments = [];
  appointments.add(Appointment(
    startTime: DateTime.now(),
    endTime: DateTime.now().add(Duration(hours: 1)),
    subject: 'Meeting',
    color: Colors.redAccent,
  ));
  appointments.add(Appointment(
    startTime: DateTime.now().add(Duration(hours: 4)),
    endTime: DateTime.now().add(Duration(hours: 6)),
    isAllDay: true,
    subject: 'Meeting',
    color: Colors.blue,
  ));
  appointments.add(Appointment(
    startTime: DateTime.now().subtract(Duration(hours: 3)),
    endTime: DateTime.now().subtract(Duration(hours: 1)),
    subject: 'Meeting',
    color: Colors.redAccent,
  ));
  appointments.add(Appointment(
    startTime: DateTime.now().subtract(Duration(hours: 5)),
    endTime: DateTime.now().subtract(Duration(hours: 2)),
    subject: 'Meeting',
    color: Colors.redAccent,
  ));
  appointments.add(Appointment(
    startTime: DateTime.now().subtract(Duration(hours: 3)),
    endTime: DateTime.now().subtract(Duration(hours: 1)),
    subject: 'Meeting',
    color: Colors.redAccent,
  ));

  return calendarData(appointments);
}
