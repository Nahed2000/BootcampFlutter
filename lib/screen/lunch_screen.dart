import 'package:bot_flut/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widget/custom_button.dart';

class LunchScreen extends StatefulWidget {
  const LunchScreen({Key? key}) : super(key: key);

  @override
  State<LunchScreen> createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 5),
            SvgPicture.asset('assets/images/onboarding.svg',
                height: 250, width: 201),
            SizedBox(height: MediaQuery.of(context).size.height / 30),
            const Text(
              'Just on Scan for everything',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 19,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 5),
            CustomButton(
              title: 'Get Started',
              onPress: () {},
            )
          ],
        ),
      ),
    );
  }
}
