import 'package:do_to_app/refactor/constants.dart';
import 'package:do_to_app/login.dart';
import 'package:do_to_app/refactor/refactor.dart';
import 'package:do_to_app/refactor/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
      TextEditingController passwordController = TextEditingController();
        TextEditingController confirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  Image.asset('lib/assets/bubble.png',
           height: 190.h,
           width: 220.w,),
          // 15.verticalSpace,
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildBoldText('Welcome to Onboard! '),
              10.verticalSpace,
              Text('Let’s help to meet up your \n\t\t\t\t\t          tasks.',
              style: TextStyle(
                fontSize: 16.sp,
              ),),
              30.verticalSpace,
             
              MyTextField(
                prefixIconPic: Icons.person,
               hint: 'Enter your full name',
               textController:nameController,
                validate:(value){
                  if(value == null || value.isEmpty){
                    return 'please enter full name';
                    }}
               ),
              10.verticalSpace,
              MyTextField(
                prefixIconPic: Icons.email,
                 hint: 'Enter your email',
                 textController: emailController,
                  validate:(value){
                  if(value == null || value.isEmpty){
                    return 'please enter email';
                    }}
                 ),
              10.verticalSpace,
               MyTextField(
                prefixIconPic: Icons.password,
                 hint: 'Enter your password',
                 textController: passwordController,
                  validate:(value){
                  if(value == null || value.isEmpty){
                    return 'please enter password';
                    }}),
              10.verticalSpace,
              MyTextField(
                prefixIconPic: Icons.confirmation_num,
                 hint: 'Confirm Password',
                 textController: confirmController,
                  validate:(value){
                  if(value == null || value.isEmpty){
                    return 'password does not matched';
                    }}),
              25.verticalSpace,
              Button(actionOfButton: (){
                if(_formKey.currentState!.validate()){
                  
                Navigator.push(
                  context,
                   MaterialPageRoute(
                    builder: (context)=>Login()
                    )
                    ); 
            
              }}, buttonTitle: 'Register'),
              6.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  Text('Sign In',
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