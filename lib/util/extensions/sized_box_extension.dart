// ignore_for_file: camel_case_extensions, unnecessary_this

import 'package:flutter/material.dart';

extension sizedBoxExtension on double {
  Widget ph() => SizedBox(
        height: this,
      );
  Widget pw() => SizedBox(
        width: this,
      );
}
