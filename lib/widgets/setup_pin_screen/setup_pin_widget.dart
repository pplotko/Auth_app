import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:auth_app/widgets/numeric_keyboard/numeric_keyboard_widget.dart';
import '../pin_code_indicator/pin_code_indicator_widget.dart';
import '../state_widget.dart';
import '../state_widget.dart';

class SetupPINWidget extends StatefulWidget {
   const SetupPINWidget({Key? key}) : super(key: key);

  @override
  State<SetupPINWidget> createState() => _SetupPINWidgetState();
}

class _SetupPINWidgetState extends State<SetupPINWidget> {
  get onTap => null;


  void incrementCounter(String inputvalue) {
    print('incrementCounter=' + inputvalue);
    final provider = StateInheritedWidget.of(context);
    provider.incrementCounter('setup', inputvalue);
  }

  MyContainer(Color fillcolor1) {
    return
      Container(
        height: 12,
        width: 12,
        padding: const EdgeInsets.all(16,),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.blueGrey,
          ),
          color: fillcolor1,
          borderRadius: BorderRadius.circular(6.0),
        ),
      );
  }

  isPsw<Widget>(int pincount) {
    if (pincount == 1) {
      return
        const Center(
          child: Text('Re-enter your PIN',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(150, 165, 190, 1),
            ),
          ),
        );
    } else {
      if (pincount == 2) {
        return
          // const AlertDialog(content: Text('Your PIN has been set up successfully!')),

          const Center(
            child:
            Text('Your PIN has been set up successfully!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(150, 165, 190, 1),
              ),
            ),
          );
      } else {
        return
          const Center(
            child: Text('Create PIN',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(150, 165, 190, 1),
              ),
            ),
          );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final String text = StateInheritedWidget
        .of(context).text;
    final int pincount = StateInheritedWidget
        .of(context).pincount;

    const Color fillcolor = Colors.white;
    const Color fullfillcolor = Color.fromRGBO(106, 80, 199, 1.0);
    String msg = '';
    double msgTransperance = 0;
    Color msgColor = Color.fromRGBO(255, 255, 255, 0);
    print(text);

    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.black, //change your color here
            ),
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('Setup PIN',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
                Text('Use 4-digits PIN',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          body: Stack(
              children: [
                Column(
                children: [
                  const SizedBox(height: 60,),
                  isPsw(pincount),
                  const SizedBox(height: 20,),
                  // Container(
                  //   color: const Color.fromRGBO(245, 245, 248, 1),
                  //   height: 40,
                  //   width: 200,
                  //   child: Center(child: Text(text)),
                  //   // child: PinCodeIndicatorWidget(key: key, text,
                  // ),
                  Container( //pin_code_indicator
                    width: 125,
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        (text.length >= 1)
                            ? MyContainer(fullfillcolor)
                            : MyContainer(fillcolor),
                        (text.length >= 2)
                            ? MyContainer(fullfillcolor)
                            : MyContainer(fillcolor),
                        (text.length >= 3)
                            ? MyContainer(fullfillcolor)
                            : MyContainer(fillcolor),
                        (text.length >= 4)
                            ? MyContainer(fullfillcolor)
                            : MyContainer(fillcolor),
                      ],
                    ),
                  ),

                  const SizedBox(height: 5,),
                  Expanded(
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
                          String i = '';
                          int _value;
                          if (index == 10) {
                            i = '0';
                          }
                          else {
                            if (index == 11) {
                              i = '<';
                            } else {
                              i = (index + 1).toString();
                            }
                          }
                          if (i != '10') {
                            return Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all (24),
                                  primary: const Color.fromRGBO(
                                      245, 245, 248, 1),
                                  elevation: 1,
                                ),
                                // onPressed: () => incrementCounter(i),
                                onPressed: () {
                                    if (pincount == 2) {Navigator.pop(context);}
                                    else {incrementCounter(i);}
                                  },
                                  child: Text(i,
                                  style: const TextStyle(
                                    color: Color.fromRGBO(150, 165, 190, 1),
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),),
                            );
                          }
                          else {
                            return Container();
                          }
                        }),
                      ),
                    ),
                  ),
                  // NumericKeyboardWidget(),
                  const SizedBox(height: 30,),
                ],
              ),
                // Center(child:
                //   Container(height: 200, width: 300,
                //     color: msgColor,
                //     child: Center(
                //       child: Text('Your PIN has been set up successfully!',
                //         style: TextStyle(
                //           color: Color.fromRGBO(0, 0, 0, msgTransperance),
                //           fontSize: 22,
                //           fontWeight: FontWeight.w400,
                //         ),
                //       ),
                //     ),
                //   )
                // ),
              ]
          ),
        )
    );
    // );
  }
}