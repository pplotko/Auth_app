import 'package:flutter/material.dart';

import 'package:auth_app/widgets/provider/auth_model.dart';


class AuthWidgetProvider extends InheritedNotifier<AuthWidgetModel> {
  final AuthWidgetModel model;
  const AuthWidgetProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
      key: key,
      notifier: model,
      child: child
  );

  static AuthWidgetModel? watch (BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AuthWidgetProvider>()
        ?.model;
  }

  static AuthWidgetModel? read (BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<AuthWidgetProvider>()?.widget;
    return widget is AuthWidgetProvider ? widget.notifier : null;

  }
}