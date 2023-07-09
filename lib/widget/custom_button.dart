import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPress,
      required this.title,
      this.isRegister = false});

  final void Function() onPress;
  final String title;
  final bool isRegister;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: isRegister ? kScaffoldColor : kSecondaryColor,
        minimumSize: const Size(double.infinity, 60),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: isRegister
                ? const BorderSide(color: kPrimaryColor)
                : BorderSide.none),
      ),
      child: Text(
        title,
        style: TextStyle(
            color: isRegister ? kPrimaryColor : kOnSecondaryColor,
            fontSize: 17),
      ),
    );
  }
}
//social meida