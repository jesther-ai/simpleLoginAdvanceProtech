import 'package:flutter/material.dart';

class TextAndLink extends StatelessWidget {
  const TextAndLink({
    required this.text,
    required this.link,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final String text;
  final String link;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 13,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: onTap,
          child: Text(
            link,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 13,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
