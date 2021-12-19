import 'package:flutter/material.dart';
import 'package:online_learning_huweii/src/configs/theme/app_theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_learning_huweii/src/ui/widgets/onboardingcontent.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;
  final PageController _controller = PageController(initialPage: 0);
  TextStyle titleStyle = TextStyle(
      color: AppTheme.colors.text4,
      fontSize: 22,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins');
  TextStyle descriptionStyle = const TextStyle(
    color: Color(0xFF858597),
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: 'Poppins',
  );

  @override
  void initState() {
    // _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 2.6 / 5;
    return Scaffold(
      body: Column(
        children: [
          (currentIndex != content.length - 1)
              ? SizedBox(
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 25.0, bottom: 15.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox(
                  height: 80,
                ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
            child: SizedBox(
              height: height < 460 ? 460 : height,
              child: PageView.builder(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemCount: content.length,
                itemBuilder: (BuildContext context, int index) {
                  //             PageTransitionSwitcher(
                  //   transitionBuilder: (
                  //     Widget child,
                  //     Animation<double> animation,
                  //     Animation<double> secondaryAnimation,
                  //   ) {
                  //     return FadeThroughTransition(
                  //       animation: animation,
                  //       secondaryAnimation: secondaryAnimation,
                  //       child: child,
                  //     );
                  //   },
                  //   child: getScreen(_selectedIndex),
                  // ),
                  return Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(content[index].image),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          content[index].title,
                          style: titleStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Text(
                          content[index].description,
                          style: descriptionStyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              content.length,
              (int index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: currentIndex == index ? 20 : 10,
                  height: 7,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                  ),
                );
              },
            ),
          ),
          if (currentIndex == content.length - 1)
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF3D5CFF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/SignUp');
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: const Color(0xFFFFFFFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                side: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 1)),
                            onPressed: () {
                              Navigator.pushNamed(context, '/LogIn');
                            },
                            child: const Text(
                              'Log In',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFF3D5CFF),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
