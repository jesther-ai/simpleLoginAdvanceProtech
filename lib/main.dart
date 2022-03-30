import 'package:advance_protech_login/provider/login_provider.dart';
import 'package:advance_protech_login/screens/login_screen.dart';
import 'package:advance_protech_login/utilities/dismiss_keyboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<LoginProvider>(create: (context) => LoginProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: const Color.fromRGBO(239, 139, 52, 1),
          ),
          home: LoginScreen(),
        ),
      ),
    );
  }
}
