import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:userregistration/pages/email.dart';
import 'Util.dart';

class StepList {
  List<Step> mySteps(int currentStep, Animation animation,BuildContext context) {
//    debugPrint("debug: step list");
    List<Step> steps = [
      step1(currentStep),
      step2(currentStep),
      step3(currentStep, animation,context)
    ];

    return steps;
  }

  card() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: new Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.white,
        child: new Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              maxLines: 1,
              autocorrect: true,
              decoration: Util.emailDecoration(),
            )),
      ),
    );
  }

  step1(int currentStep) {
    return Step(
        title: Text(''),
        isActive: currentStep >= 0,
        content: Column(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisSize: MainAxisSize.max,
//            mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
//                padding: const EdgeInsets.only(left: 0.0),

              child: RichText(
                text: TextSpan(
                    text: "Welcome to \nGIN ",
                    style: Util.textStyle(color: Colors.black, fontSize: 45),
                    children: [
                      TextSpan(
                          text: "Finans",
                          style: Util.textStyle(color: Colors.blueAccent)),
                      TextSpan(
                          text:
                              "\nWelcome to The Bank of The Future. \nManage and track your accounts on the go.",
                          style: Util.textStyle(fontSize: 20))
                    ]
//                      children: [TextSpan()]),
                    ),
              ),
            ),
            SizedBox(height: 40.0),
            card(),
          ],
        ));
  }

  step2(int currentStep) {
    return Step(
        title: Text(''),
        isActive: currentStep >= 1,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
                child: RichText(
              text: TextSpan(
                  text: "Create Password\n \n",
                  style: Util.textStyle(color: Colors.white, fontSize: 20),
                  children: [
                    TextSpan(
                        text:
                            "Password will be used to login to the account.\n\n",
                        style:
                            Util.textStyle(color: Colors.white, fontSize: 10)),
                  ]
//                      children: [TextSpan()]),
                  ),
            )),
            Container(
                child: TextFormField(
              obscureText: true,
              autocorrect: false,
              decoration: Util.passwordDecoration(),
              onChanged: (text) {
                if (text.contains("a")) {}
                print("First text field: $text");
              },
            )),
            Container(
              child: RichText(
                text: TextSpan(
                    text: "\n Complexity: $currentStep \n",
                    style: Util.textStyle()),
              ),
            ),
            SizedBox(height: 40),
            Util().fourComplexitySection,
          ],
        ));
  }

  step3(int currentStep, Animation animation, BuildContext context) {
    return Step(
        title: Text(''),
        isActive: currentStep >= 2,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white,
                        blurRadius: animation.value,
                        spreadRadius: animation.value)
                  ]),
              child: new IconButton(
//                  color: Colors.grey,
                  icon: new Icon(
                    Icons.calendar_today,
                    color: Colors.blue,
                  ),
                  onPressed: null),
            ),
            Container(
                child: RichText(
                    text: TextSpan(
                        text: "Schedule Video Call.\n",
                        style: Util.textStyle(fontSize: 25)))),
            Container(
              child: RichText(
                text: TextSpan(
                    text:
                        "Choose the date time that you prefer. We will send a link via email to make video call on the scheduled date and time. \n",
                    style: Util.textStyle()),
              ),
            ),
            SizedBox(height: 40),
            Util.buttons("Choose Date", context),
            Util.buttons("Choose Time",context)
          ],
        ));
  }
}
