import 'package:advance_protech_login/provider/login_provider.dart';
import 'package:advance_protech_login/widgets/dialog.dart';
import 'package:advance_protech_login/widgets/input_textfield.dart';
import 'package:advance_protech_login/widgets/primary_button.dart';
import 'package:advance_protech_login/widgets/text_and_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login';
  // final TextEditingController emailNumber = TextEditingController(text: 'jesther@advanceprotech.com');
  // final TextEditingController password = TextEditingController(text: 'jesther11');
  final TextEditingController emailNumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode emailNumberFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color.fromRGBO(239, 139, 52, 1)),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        body: Center(
          child: AnimationConfiguration.staggeredList(
            position: 0,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              layoutBuilder: (widget, animation) {
                return FadeInAnimation(
                  duration: const Duration(milliseconds: 500),
                  child: widget!,
                  delay: const Duration(milliseconds: 100),
                );
              },
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Consumer<LoginProvider>(builder: (context, value, child) {
                    Future.delayed(const Duration(milliseconds: 100), () {
                      if (!value.isLoading) {
                        generalDialog(context: context, message: value.message, isAutoClose: true, isLoading: value.isSuccess);
                        value.reset();
                      }
                    });
                    Future.delayed(const Duration(milliseconds: 2000), () {
                      if (value.isSuccess) {
                        debugPrint('Succes');
                        value.reset();
                      }
                    });
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          child: Image.asset(
                            'assets/images/logo.png',
                            fit: BoxFit.contain,
                            height: 120,
                            width: double.infinity,
                          ),
                        ),
                        const SizedBox(height: 25),
                        InputTextField(
                          focusNode: emailNumberFocus,
                          controller: emailNumber,
                          hintText: 'Email',
                          height: 55,
                          keyboardType: TextInputType.text,
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                          suffixIconPadding: const EdgeInsets.only(top: 1, bottom: 10, right: 10),
                          suffixIcon: IconButton(
                            onPressed: () => value.setPasswordObscure(),
                            icon: Icon(Icons.email_outlined, color: Theme.of(context).primaryColor, size: 20),
                          ),
                        ),
                        const SizedBox(height: 25),
                        InputTextField(
                          focusNode: passwordFocus,
                          controller: password,
                          hintText: 'Password',
                          height: 55,
                          keyboardType: TextInputType.text,
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                          suffixIconPadding: const EdgeInsets.only(top: 1, bottom: 10, right: 10),
                          obscureText: value.passwordObscure,
                          suffixIcon: IconButton(
                            onPressed: () => value.setPasswordObscure(),
                            icon: Icon(
                              value.passwordObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                              color: Theme.of(context).primaryColor,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextAndLink(
                          text: 'Forgot Password?',
                          link: 'Tap here',
                          onTap: () => debugPrint('Forgot Password Screen'),
                        ),
                        const SizedBox(height: 15),
                        PrimaryButton(
                          label: 'Login',
                          width: double.infinity,
                          height: 50,
                          action: () {
                            if (emailNumber.text.isNotEmpty && password.text.isNotEmpty) {
                              value.sendAPI(emailNumber.text, password.text);
                              passwordFocus.unfocus();
                              emailNumberFocus.unfocus();
                              generalDialog(
                                context: context,
                                message: value.message,
                                isAutoClose: true,
                                isLoading: true,
                              );
                            } else {
                              generalDialog(
                                context: context,
                                message: 'Please Fill-out all fields',
                                isAutoClose: true,
                                isLoading: false,
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 15),
                        TextAndLink(
                          text: 'Don\'t have account?',
                          link: 'Register Here',
                          onTap: () => debugPrint('Registration Screen'),
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
