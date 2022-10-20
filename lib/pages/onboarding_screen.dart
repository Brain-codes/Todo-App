// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_app/intro_screens/intro_page_1.dart';
import 'package:todo_app/intro_screens/intro_page_2.dart';
import 'package:todo_app/intro_screens/intro_page_3.dart';
import 'package:todo_app/pages/account_edit.dart';
import 'package:todo_app/pages/home_page.dart';

import '../data/database.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  TodoDataBase db = TodoDataBase();

  //CONTROLLER IS TO KEEP TRACK OF WHUICH PAGE WE ARE ON
  PageController _controller = PageController();
  //KEEP TRACK OF THE LAST PAGE
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
        body: Stack(
      children: [
        //PAGE VIEW
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),

        //DOT INDIATOR
        Container(
            alignment: Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //SKIP
                GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: Text(
                    'Skip',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                //DOT INDICATOR
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                      dotColor: Color.fromARGB(255, 255, 255, 255),
                      activeDotColor: Color(0xFF250b5a)),
                ),

                //NEXT OR DONE
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          db.onBoardingDone();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return AccountEdit(type: 'starting',);
                              },
                            ),
                          );
                        },
                        child: Text(
                          'Done',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ))
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                        child: Text(
                          'Next',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
              ],
            ))
      ],
    ));
  }
}
