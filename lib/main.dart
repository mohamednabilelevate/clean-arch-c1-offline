import 'package:elevate_online_exam_c1_offline/core/di.dart';
import 'package:elevate_online_exam_c1_offline/presentation/ui/login/LoginScreen.dart';
import 'package:flutter/material.dart';

void main()async{
  configureDependencies();

  runApp(MaterialApp(
    home: Loginscreen(),
  ));
}