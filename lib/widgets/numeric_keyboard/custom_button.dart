import 'package:auth_app/widgets/provider/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String outputValue;

  const CustomButton({Key? key, required this.outputValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void incrementCounter(String inputValue) {
      print('incrementCounter=' + inputValue);
      AuthWidgetProvider.read(context)?.inputValue = inputValue;
      AuthWidgetProvider.read(context)?.pinCounter();
      AuthWidgetProvider.read(context)?.selectSetupPinScreenMessage();
      AuthWidgetProvider.read(context)?.selectLoginPinScreenMessage();
    }

    // return
    if (outputValue == '<') {
          return Center(
            child: InkWell(
              onTap: () => incrementCounter(outputValue),
              child: Container(height: 50, width: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: const Icon(CupertinoIcons.delete_left,
                    color:Colors.black,
                  ),
                ),
              splashColor:Colors.white,
              focusColor:Colors.white,
              hoverColor:Colors.white,
              highlightColor:Colors.white,
            )
          );
        }
        else {
          return Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all (24),
                primary: const Color.fromRGBO(
                    245, 245, 248, 1.0),
                elevation: 1,
              ),
              onPressed: () async {
                incrementCounter(outputValue);
                if (AuthWidgetProvider.read(context)?.pinStageCounter == 2
                    && AuthWidgetProvider.read(context)?.mode == 'setup') {
                await Future.delayed(const Duration(milliseconds: 100));
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    // title: const Text('AlertDialog Title'),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    content: const Text('Your PIN has been set up successfully!'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pushNamed (context, '/'),
                        child: const Center(child: Text('OK')),
                      ),
                    ],
                  ),
                );
                }
                if (AuthWidgetProvider.read(context)?.pinStageCounter == 3
                    && AuthWidgetProvider.read(context)?.mode == 'login') {
                  await Future.delayed(const Duration(milliseconds: 100));
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      // title: const Text('AlertDialog Title'),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      content: const Text('Authentication success!'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pushNamed (context, '/welcome_page'),
                          child: const Center(child: Text('OK')),
                        ),
                      ],
                    ),
                  );}
                },
              child: Text(outputValue,
                style: const TextStyle(
                  color: Color.fromRGBO(150, 165, 190, 1),
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          );
        }
  }
}
