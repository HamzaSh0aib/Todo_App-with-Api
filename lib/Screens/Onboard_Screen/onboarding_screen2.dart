import 'package:flutter/material.dart';
import 'package:todo_app/Screens/Onboard_Screen/onboarding_screen3.dart';
import 'package:todo_app/utils/AppColor.dart';
import 'package:todo_app/widgets/globalwidgets.dart';

class OnBoarding2_Screen extends StatefulWidget {
  const OnBoarding2_Screen({super.key});

  @override
  State<OnBoarding2_Screen> createState() => _OnBoarding2_ScreenState();
}

class _OnBoarding2_ScreenState extends State<OnBoarding2_Screen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.050),
        child: Center(
          child: Column(
            children: [
              Image(
                image: const AssetImage('assets/images/Second_Initial_Pic.png'),
                height: screenHeight * 0.400,
                width: screenWidth * 0.600,
              ),
              SizedBox(
                height: screenHeight * 0.040,
              ),
              Image(image: AssetImage('assets/images/line.png')),
              SizedBox(
                height: screenHeight * 0.040,
              ),
              Text(
                'Create daily routine',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * 0.035,
                  fontFamily: 'Poppins_Regular',
                ),
              ),
              SizedBox(
                height: screenHeight * 0.030,
              ),
              Text(
                '       In Uptodo you can create your \n personalized routineto stay productive',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontFamily: 'Poppins_Regular',
                    fontSize: screenHeight * 0.018),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: screenHeight * 0.055),
                child: button(
                    screenheight: screenHeight,
                    screenwidth: screenWidth,
                    text: 'Next',
                    width: 0.650,
                    height: 0.050,
                    ontap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  Onboarding3_Screen()));
                    }),
              ),
           
            ],
          ),
        ),
      )),
    );;
  }
}
