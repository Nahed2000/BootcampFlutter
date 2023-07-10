// ignore_for_file: use_build_context_synchronously

import 'package:bot_flut/model/api_response.dart';
import 'package:bot_flut/util/helper.dart';
import 'package:flutter/material.dart';
import 'package:bot_flut/constants.dart';
import 'package:bot_flut/widget/custom_button.dart';
import 'package:flutter_svg/svg.dart';

import '../../api/controller/auth_controller.dart';
import '../../widget/custom_textfield.dart';
import '../../widget/social_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with Helper {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;

  @override
  void initState() {
    // TODO: implement initState
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    passwordController.dispose();
    emailController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kPrimaryColor,
          ),
        ),
        elevation: 0,
        backgroundColor: kScaffoldColor,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              'assets/images/auth.svg',
              height: 130,
              width: 250,
            ),
          ),
          const SizedBox(height: 25),
          CustomTextField(
              controller: nameController, title: 'Name', hint: 'Jhon Doe'),
          const SizedBox(height: 15),
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
                  ? await register()
                  : showSnackBar(context,
                      message: 'Enter Required Data !', error: true);
            },
            title: 'Register',
          ),
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
    );
  }

  bool checkData() {
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        nameController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<void> register() async {
    ApiResponse apiResponse = await ApiAuthController().register(
        name: nameController.text,
        password: passwordController.text,
        email: emailController.text);
    if (apiResponse.status) Navigator.pop(context);
    showSnackBar(context,
        message: apiResponse.message, error: !apiResponse.status);
  }
}
