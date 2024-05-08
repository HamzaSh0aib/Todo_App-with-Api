import 'package:flutter/material.dart';
import 'package:todo_app/Screens/Onboard_Screen/onboarding_screen2.dart';
import 'package:todo_app/utils/AppColor.dart';
import 'package:todo_app/widgets/globalwidgets.dart';

class Onboarding1_Screen extends StatefulWidget {
  const Onboarding1_Screen({super.key});

  @override
  State<Onboarding1_Screen> createState() => _Onboarding1_ScreenState();
}

class _Onboarding1_ScreenState extends State<Onboarding1_Screen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;

    return Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: SafeArea(
            child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.050),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage('assets/images/1st_Initial_Pic.png'),
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
                Center(
                    child: Text(
                  'Manage your tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenHeight * 0.035,
                    fontFamily: 'Poppins_Regular',
                  ),
                )),
                SizedBox(
                  height: screenHeight * 0.030,
                ),
                Center(
                  child: Text(
                    'You can easily manage all of your daily \n                tasks in DoMe for free',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontFamily: 'Poppins_Regular',
                        fontSize: screenHeight * 0.018),
                  ),
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
                                builder: (context) => const OnBoarding2_Screen()));
                      }),
                ),
              ],
            ),
          ),
        )));;
  }
}