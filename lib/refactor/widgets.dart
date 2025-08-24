import 'package:do_to_app/refactor/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class Button extends StatefulWidget {
    final String buttonTitle;
    VoidCallback actionOfButton;
    
    Button({super.key,
    required this.actionOfButton,
    required this.buttonTitle
    });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: cyanColor,
             minimumSize: Size(310.w, 50.h),
              shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4.r), 
    ),
          ),
      onPressed: widget.actionOfButton,
       child: Text(widget.buttonTitle,
       style: TextStyle(color: whiteColor),),
     
       );
  }
}


// ignore: must_be_immutable
class MyTextField extends StatefulWidget {
  final String? Function(String?)? validate;
  final IconData prefixIconPic;
  final String hint;
  TextEditingController textController;

   MyTextField({super.key,
   required this.prefixIconPic,
   required this.hint,
   required this.textController,
   required this.validate,
   });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
    final TextEditingController textController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:widget.validate,
      controller: textController,
      decoration: InputDecoration(
        hintText: widget.hint,
        contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 12.w),
        prefixIcon: Icon(
          widget.prefixIconPic
        ,color: cyanColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(color: Colors.white),
          
          ),
      ),
    );
  }
}