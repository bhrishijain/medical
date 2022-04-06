import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/onboarding_model.dart';
import 'home.dart';

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreens> createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {

  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/bg-1.png',

            )
          )
        ),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(

                  controller: _controller,
                  //itemCount: contents.length,
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 90,),
                          child: Image.asset(
                           contents[i].image,
                            height: 240,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0, 26, 0.0, 42.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              contents.length,
                                  (index) => buildDot(index, context),
                            ),
                          ),
                        ),
                        Text(
                          contents[i].title.tr,
                          style: const TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w400,
                            color: Colors.white
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          contents[i].description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,

                          ),
                        )
                      ],
                    );
                  },
                ),
              ),

              ///dots indicator


              ///button

              GestureDetector(
//                onTap: () async {
//                  SharedPreferences prefs = await SharedPreferences.getInstance();
//                  prefs.setBool('seen',true);
//                  Navigator.of(context).pushReplacement(
//                      MaterialPageRoute(builder: (context) =>  Home()));
//                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Container(
                   child:
                   Center(
                     child: Text(
                      "Next".tr,
                     style:  const TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.w600,
                       fontSize: 24
                     ),
                     ),),
                    height: 70.0,
                    width: MediaQuery.of(context).size.width - 200.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        //color: Colors.blue,
                        image: const DecorationImage(
                            image:  AssetImage(
                                'assets/btn.png'
                            ),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width:  currentIndex == index ? 30 : 11,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        //color: Theme.of(context).primaryColor,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(

              currentIndex == index ?  'assets/select.png' : 'assets/none.png',


          )
        )
      ),
    );
  }
}
