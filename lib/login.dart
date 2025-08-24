import 'package:do_to_app/home.dart';
import 'package:do_to_app/refactor/constants.dart';
import 'package:do_to_app/refactor/refactor.dart';
import 'package:do_to_app/refactor/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}


class _LoginState extends State<Login> {
  
 
 void performLogin(){
   if(_formKey.currentState!.validate()){
                // if(emailController.text == 'nawaira'){
                    Navigator.push(
                      context,
                       MaterialPageRoute(
                        builder: (context)
                        =>Home()
                        )
                        );
                        // }
               }
 }
    TextEditingController emailController = TextEditingController();
      TextEditingController passwordController = TextEditingController();
      final _formKey = GlobalKey<FormState>();
        
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  Image.asset('lib/assets/bubble.png',
           height: 190.h,
           width: 220.w,),
           15.verticalSpace,
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildBoldText('Welcome back! '),
                Image.asset('lib/assets/login.png',
                height: 150.h,
                width: 180.h,),
              30.verticalSpace,

              MyTextField(
                prefixIconPic: Icons.email,
                 hint: 'Enter your email',
                 textController: emailController,
                 validate:(value){
                  if(value == null || value.isEmpty){
                    return 'please enter email';
                    }} ),
              10.verticalSpace,
               MyTextField(
                prefixIconPic: Icons.password,
                 hint: 'Enter your password',
                 textController: passwordController,
                  validate:(value){
                  if(value == null || value.isEmpty){
                    return 'please enter password';
                    }}),
              50.verticalSpace,
              Button(actionOfButton: (){
              performLogin();
              }, buttonTitle: 'Login'),
              6.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dont have an account?'),
                  Text('Sign Up',
                  style: TextStyle(
                    color: cyanColor
                  ),)
                ],
              )
            ],),
          ),
        )
            ],
          ),
      ),
      
    );
  }
}