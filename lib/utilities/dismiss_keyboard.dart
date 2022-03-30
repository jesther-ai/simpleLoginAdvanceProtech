import 'package:flutter/material.dart';

// The DismissKeybaord widget (it's reusable)
class DismissKeyboard extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const DismissKeyboard({required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}
