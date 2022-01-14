import 'package:flutter/material.dart';

import '../pin_code_indicator/pin_code_indicator_widget.dart';
import 'package:auth_app/widgets/authentication_screen/authentication_widget.dart';
import 'package:auth_app/widgets/setup_pin_screen/setup_pin_widget.dart';

// class NumericKeyboardWidget extends StatelessWidget {
//
//   const NumericKeyboardWidget({Key? key}) : super(key: key);
NumericKeyboardWidget() => Expanded(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: GridView.count(
          crossAxisSpacing: 40,
          mainAxisSpacing: 0,
          // Create a grid with 3 columns. If you change the scrollDirection to
          // horizontal, this produces 4 rows.
          crossAxisCount: 3,
          // Generate 12 widgets that display their index in the List.
          children: List.generate(12, (index) {
            String i= '';
            int _value;
            if (index == 10) {i='0';}
            else {
              if (index == 11) {i = '<';}
              else {i = (index + 1).toString();}
            }
            if (i != '10' ) {
              return Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all (24),
                    primary: const Color.fromRGBO(245, 245, 248, 1),
                    elevation: 1,
                  ),
                  onPressed:() {},
                  // {setText(i);},

                      // _value = index+1;
                      // print(_value);
                      // DataProviderInherited(
                      //   value: _value,
                      //   child: PinCodeIndicatorWidget(key:key),
                      // );


                    // password += i.toString();
                    // Navigator.pushNamed(context, '/authentication');
                  // },
                  child: Text(i,
                    style: const TextStyle(
                      color: Color.fromRGBO(150, 165, 190, 1),
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              );}
            else {
              return Container();}
          }),

        ),
      ),
    );
// }



// class DataProviderInherited extends InheritedWidget {
//   final int value;
//
//   const DataProviderInherited({
//     Key? key,
//     required this.value,
//     required Widget child,
//   }) : super(key: key, child: child);
//
//   @override
//   bool updateShouldNotify(DataProviderInherited oldWidget) {
//     return value != oldWidget.value;
//   }
// }