import "package:flutter/material.dart";
import 'package:userregistration/pages/StepList.dart';

import 'Util.dart';

class Email extends StatefulWidget {
  @override
  _EmailState createState() => _EmailState();
}

class _EmailState extends State<Email> with SingleTickerProviderStateMixin {
  AnimationController animatedContainer;
  static Animation animation;

  @override
  void initState() {
    debugPrint("debug: init state");
    animatedContainer =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animatedContainer.repeat(reverse: true);
    animation = Tween(begin: 10.0, end: 10).animate(animatedContainer)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _agreedToTOS = true;
  int currentStep = 0;
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
//    debugPrint("debug: build");
    return new Scaffold(
//        backgroundColor: Colors.black,
      appBar: AppBar(
        title: Util.getAppBarText(currentStep),
        elevation: 0,
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Container(
          height: double.maxFinite,
          decoration: new BoxDecoration(
            color: Util.getContainerColor(currentStep),
//            borderRadius: BorderRadius.only(topLeft: Radius.circular(175.0)),
          ),
//          color: Colors.lightBlue,
          child: Theme(
            isMaterialAppTheme: true,
            data: ThemeData(canvasColor: Colors.lightBlue),
            child: Stepper(
                steps: StepList().mySteps(currentStep,animation,context),
                currentStep: this.currentStep,
                onStepTapped: (step) {
                  setState(() {
                    this.currentStep = step;
                  });
                },
                onStepContinue: continueClicked,
                controlsBuilder: (BuildContext context,
                    {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
                  return Container(
                    margin: const EdgeInsets.only(top: 100.0),
                    color: Colors.blue,
                    child: FlatButton(
                      onPressed: onStepContinue,
                      child: Text(
                        'NEXT',
                        style: Util.textStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
                type: StepperType.horizontal),
          ),
        ),
      ),
    );
  }

  continueClicked() {
    //  print("object clicked ${StepList().mySteps(currentStep).length - 1}");
    setState(() {
      if (this.currentStep < StepList().mySteps(currentStep,animation,context).length - 1) {
        this.currentStep = currentStep + 1;
      }
    });
  }
}


