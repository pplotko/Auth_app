// import 'package:flutter/material.dart';
//
// import '../numeric_keyboard/numeric_keyboard_widget.dart';
// import 'package:auth_app/widgets/authentication_screen/authentication_widget.dart';
// import 'package:auth_app/widgets/setup_pin_screen/setup_pin_widget.dart';
//
// class PinCodeIndicatorWidget extends StatefulWidget {
//   PinCodeIndicatorWidget({Key? key /*required String text*/}) : super(key: key);
//
//   @override
//   _PinCodeIndicatorWidgetState createState() => _PinCodeIndicatorWidgetState();
// }
//
// class _PinCodeIndicatorWidgetState extends State<PinCodeIndicatorWidget> {
//
//   // void _incriment() {
//   //   _value += 1;
//   //   setState(() {
//   //
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     // final value = getInherit<DataProviderInherited>(context)?.value ?? -1;
//     // final value = getInherit<DataProviderInherited>(context)?.value ?? -1;
//     // print('$value');
//     String text;
//
//     return Center(child: Text('text'));
//   }
// }
//
// T? getInherit <T>(BuildContext context) {
//   final element =context.
//     getElementForInheritedWidgetOfExactType<DataProviderInherited>();
//   if (element != null) {
//     context.dependOnInheritedElement(element);
//   }
//   final widget = element?.widget;
//   if (widget is T) {
//     return widget as T;
//   }
//   else {
//     return null;
//   }
// }