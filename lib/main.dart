import 'package:bot_flut/screen/app/home_screen.dart';
import 'package:bot_flut/screen/auth/login.dart';
import 'package:bot_flut/screen/auth/register.dart';
import 'package:bot_flut/screen/lunch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/lunch_screen',
          routes: {
            '/lunch_screen': (context) => const LunchScreen(),
            '/login_screen': (context) => const LoginScreen(),
            '/register_screen': (context) => const RegisterScreen(),
            '/home_screen': (context) => const HomeScreen(),
          },
        );
      },
    );
  }
}
