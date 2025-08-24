import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildBoldText(String text){
  return(
    Text(text,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18.sp,
    ),)
  );
}