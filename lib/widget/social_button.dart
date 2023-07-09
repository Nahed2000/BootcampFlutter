import 'package:flutter/material.dart';

import '../constants.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key,
    required this.onPress,
    required this.title,
  });

  final void Function() onPress;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('assets/images/google.png', color: kRedColor,height: 24,width: 24),
      ),
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: kScaffoldColor,
        minimumSize: const Size(double.infinity, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: const BorderSide(
            color: kRedColor,
            width: 3,
          ),
        ),
      ),
      label: Text(
        title,
        style: const TextStyle(color: kRedColor),
      ),
    );
  }
}
