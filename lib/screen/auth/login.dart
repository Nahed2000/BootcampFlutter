// ignore_for_file: use_build_context_synchronously

import 'package:bot_flut/api/controller/auth_controller.dart';
import 'package:bot_flut/constants.dart';
import 'package:bot_flut/util/helper.dart';
import 'package:bot_flut/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../model/api_response.dart';
import '../../widget/custom_textfield.dart';
import '../../widget/social_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Helper {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: SvgPicture.asset(
                'assets/images/auth.svg',
                height: 150,
                width: 250,
              ),
            ),
            CustomTextField(
                controller: emailController,
                title: 'Email',
                hint: 'Example@gmail.com'),
            const SizedBox(height: 15),
            CustomTextField(
                controller: passwordController,
                title: 'Password',
                hint: '*********'),
            const SizedBox(height: 15),
            CustomButton(
                onPress: () async {
                  checkData()
                      ? await login()
                      : showSnackBar(context,
                          message: 'Enter Required Data !', error: true);
                },
                title: 'Login'),
            const SizedBox(height: 20),
            CustomButton(
                onPress: () async {
                  Navigator.pushNamed(context, '/register_screen');
                },
                title: 'Register',
                isRegister: true),
            const SizedBox(height: 25),
            const Text(
              '-   or   -',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 19, color: kLinksColor),
            ),
            const SizedBox(height: 25),
            SocialMediaButton(
              title: 'SIGN IN WITH GOOGLE',
              onPress: () {
                showSnackBar(context,
                    message: 'Something went wrong', error: true);
              },
            )
          ],
        ),
      ),
    );
  }

  bool checkData() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> login() async {
    ApiResponse apiResponse = await ApiAuthController()
        .login(password: passwordController.text, email: emailController.text);
    if (apiResponse.status) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/home_screen', (route) => false);
    }
    showSnackBar(context,
        message: apiResponse.message, error: !apiResponse.status);
  }
}
