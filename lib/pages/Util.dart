import 'dart:math';

import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:userregistration/pages/DateCalender.dart';

class Util {
  static textStyle({Color color, double fontSize}) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        fontFamily: 'Serif',
        color: color);
  }

  static textStyleNormal({Color color, double fontSize}) {
    return TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
        fontFamily: 'Serif',
        color: color);
  }

  static getContainerColor(int currentStep) {
    switch (currentStep) {
      case 0:
        return Colors.grey[100];
        break;
      default:
        return Colors.lightBlue;
        break;
    }
  }

  static getAppBarText(int currentStep) {
    switch (currentStep) {
      case 0:
        return new Text("");
        break;
      case 1:
        return new Text("Create Account");
        break;
    }
  }

  static emailDecoration() {
    return InputDecoration(
        filled: true,
        fillColor: Colors.grey[100],
        hintText: "Email",
        prefixIcon: Icon(Icons.email),
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          borderSide: BorderSide(color: Colors.white),
        )); //
  }

  static passwordDecoration() {
    return InputDecoration(
        //   hintText: "Email",
        filled: true,
        fillColor: Colors.white,
        hintText: "password",
        hintStyle: TextStyle(color: Colors.grey),
        suffixIcon: Icon(
          Icons.remove_red_eye,
          color: Colors.blue,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(
                color: Colors
                    .white))); // borderSide: BorderSide(color: Colors.grey)
  }

  static buttons(String text, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100.0),
      color: Colors.blue,
      child: FlatButton(
        onPressed: () {
          if (text.contains("Time")) {
            _DateCalenderState().selectTime(context);

          }
          else {
            _DateCalenderState().selectDate(context);
            debugPrint(
                "bebug : clicked ${_DateCalenderState().selectedDate}");
//          _DateCalenderState().selectDate(context);
          }
        },
        child: Text(
          text,
          style: Util.textStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget fourComplexitySection = new Container(
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        new Column(children: <Widget>[
//          AnimatedOpacity(
//              opacity:0,
//              child: new Checkbox(value: true,checkColor: Colors.green,)),
          new Text("a",
              style: textStyleNormal(color: Colors.white, fontSize: 20)),
          new Text("Lowercase",
              style: textStyleNormal(color: Colors.white, fontSize: 10)),
        ]),
        new Column(children: <Widget>[
          new Text("A",
              style: textStyleNormal(color: Colors.white, fontSize: 20)),
          new Text("Uppercase",
              style: textStyleNormal(color: Colors.white, fontSize: 10)),
        ]),
        new Column(children: <Widget>[
          new Text("123",
              style: textStyleNormal(color: Colors.white, fontSize: 20)),
          new Text("number",
              style: textStyleNormal(color: Colors.white, fontSize: 10)),
        ]),
        new Column(children: <Widget>[
          new Text("9+",
              style: textStyleNormal(color: Colors.white, fontSize: 20)),
          new Text("character",
              style: textStyleNormal(color: Colors.white, fontSize: 10)),
        ])
        //build in a separated function
      ],
    ),
  );

  static animationController() {}
}

class DateCalender extends StatefulWidget {
  @override
  _DateCalenderState createState() => _DateCalenderState();
}

class _DateCalenderState extends State<DateCalender> {
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();

  Future<TimeOfDay> selectTime(BuildContext context) async {
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
//      setState(() {
//        selectedTime = picked;
//      });
      selectedTime = picked;
    return selectedTime;
//      debugPrint("debug $selectedTime");
  }

  Future<Null> selectDate(BuildContext context) async {
//    debugPrint("bebug : se;ect date");
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1990),
        lastDate: DateTime(2100),
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        });

    if (picked != null && picked != selectedDate)
//      setState(() {
//        currentDay = picked;
//      }
      selectedDate = picked;
//    debugPrint("debug $currentDay");
//      );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
