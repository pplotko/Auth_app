import 'package:flutter/material.dart';

class StateWidget extends StatefulWidget {
  final Widget child;
  const StateWidget({Key? key,
  required this.child}) : super(key: key);

  @override
  _StateWidgetState createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  int counter = 0;
  String text = '';
  String pin = '-1';
  int i = 0;
  bool complit = false;
  int pincount = 0;
  String psw = '';
  String mode='';

  void incrementCounter(String mode, String value) {
    // setState(() => counter = counter +value);
    print(mode);
    setState(() {
      if (value != '<') {
        i += 1;
        if (i < 5) {
          text += value;
        } else {
          i = 1;
          text = value;
        }
      } else {
        text = text.substring(0, i-1);
        (i > 0) ? i -= 1 : i = 0;
      };
      if (i == 4 && complit == false && mode == 'setup') {
        complit = true;
        pin = text;
        print('repeat PIN');
        pincount = 1;
      } else {
        if (i==4 && pincount == 1 && pin == text && mode == 'setup') {
          print('Good PIN');
          psw = pin;
          pincount = 2;
          text='';
        }
        if (text == psw && pincount == 2 && mode == 'login') {
          pincount = 3;
          print('Good PIN has been enter');
        } else {print('Bad PIN has been enter');}
      }
    });
  }

  @override
  Widget build(BuildContext context) => StateInheritedWidget(
    child: widget.child,
    text: text,
    psw: psw,
    pincount: pincount,
    mode: mode,
    stateWidget: this,
  );
}

class StateInheritedWidget extends InheritedWidget {
  // final int counter;
  final String text;
  final String psw;
  final int pincount;
  final String mode;
  final _StateWidgetState stateWidget;

  const StateInheritedWidget({
    Key? key,
    required Widget child,
    required this.text,
    required this.psw,
    required this.pincount,
    required this.mode,
    required this.stateWidget,
  }) : super(key: key, child: child);

  static _StateWidgetState of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<StateInheritedWidget>()!.stateWidget;


  @override
  bool updateShouldNotify(StateInheritedWidget oldWidget) =>
      oldWidget.text != text;


}
