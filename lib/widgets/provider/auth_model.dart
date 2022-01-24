import 'package:flutter/material.dart';

class AuthWidgetModel extends ChangeNotifier{
  String text = '';
    String pin = '';
    int index = 0;
    bool complit = false;
  int pinStageCounter = 0;
  String password = '';
  String mode='';
  String? inputValue='';
  String setupPinScreenMessage='Create PIN';
  String loginPinScreenMessage='Enter your PIN';

  void pinCounter() {
    print('mode = $mode');
    print('inputValue = $inputValue');
    if (inputValue != '<') {
      index += 1;
      if (index < 5) {
        text += inputValue!;
        print('pinCounterText = $text');
        print('index = $index');
      } else {
        index = 1;
        text = inputValue!;
      }
    } else {
        text = text.substring(0, ((index == 0) ? index = 0 : index -= 1));
        print('pinCounterText = $text');
        print('index = $index');
    }

    if (index == 4 && complit == false && mode == 'setup') {
      complit = true;
      pin = text;
      print('repeat PIN');
      pinStageCounter = 1;
    } else {
      if (index==4 && pinStageCounter == 1 && pin == text && mode == 'setup') {
        print('Good PIN');
        password = pin;
        pinStageCounter = 2;
      }
      if (text == password && pinStageCounter == 2 && mode == 'login') {
        pinStageCounter = 3;
        print('Good PIN has been enter');
      } else {
        print('Bad PIN has been enter');
        // loginPinScreenMessage= 'Bad PIN has been enter';
      }
    }
    if (index > 4) {
      index = 0;
      text='';
    }
    print('pinStageCounter = $pinStageCounter');
    notifyListeners();
  }

  void selectSetupPinScreenMessage() {
    print('pinCount in the selectMessage = $pinStageCounter');
    if (pinStageCounter == 1) {
      setupPinScreenMessage= 'Re-enter your PIN';
    } else {
      if (pinStageCounter == 2) {
        // setupPinScreenMessage= 'Your PIN has been set up successfully!';
        setupPinScreenMessage= 'Re-enter your PIN';
      } else {
        setupPinScreenMessage= 'Create PIN';
      }
    }
    notifyListeners();
  }

  void selectLoginPinScreenMessage() {
    if (mode=='login' && pinStageCounter <2) {
      loginPinScreenMessage = 'Please create PIN first';
      index = 0;
      text='';
    } else {
      if (mode == 'login' && pinStageCounter == 2 && index < 4) {
        loginPinScreenMessage = 'Enter your PIN';
      } else {
        if (mode == 'login' && pinStageCounter == 2 && index == 4 &&
            text != pin) {
          loginPinScreenMessage = 'Bad PIN has been enter';
          index = 0;
          text='';
        }
      }
    }
    notifyListeners();
  }


}
