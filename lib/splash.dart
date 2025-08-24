import 'package:do_to_app/register.dart';
import 'package:do_to_app/refactor/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         Image.asset('lib/assets/bubble.png',
         height: 190.h,
         width: 220.w,),
         30.verticalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset('lib/assets/list.png',
                height: 154.h,
                width: 194.w,
                ),
              ),
               25.verticalSpace,
          Text('Gets things with TODs',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.sp
          ),),
          10.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(left:25,right: 20),
            child: Text('Lorem ipsum dolor sit amet consectetur.Eget sit nec et euismod.Consequat urna quam felis interdum quisque.Malesuada adipiscing tristique ut eget sed.',
            style: TextStyle(fontSize: 15.sp),),
          ),
             60.verticalSpace,
          Button(
            actionOfButton: ()=>navigate(context),
             buttonTitle: 'Get Started'
             ),
            ],
          ),
         

                  ],
      ),
    );
  }
}

void navigate(BuildContext context){
  Navigator.push(
    context,
   MaterialPageRoute(builder:
    (contex)=> Register()
    )
    );
}