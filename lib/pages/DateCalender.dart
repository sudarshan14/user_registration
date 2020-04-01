import 'package:flutter/material.dart';

class DateCalender extends StatefulWidget {
  @override
  _DateCalenderState createState() => _DateCalenderState();
}

class _DateCalenderState extends State<DateCalender> {
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime currentDay = DateTime.now();

  Future<Null> selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        });

    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        firstDate: currentDay,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        });

    if (picked != null && picked != currentDay)
      setState(() {
        currentDay = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
