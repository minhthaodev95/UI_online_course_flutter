import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_learning_huweii/src/ui/account_screen.dart';
import 'package:online_learning_huweii/src/ui/course_screen.dart';
import 'package:online_learning_huweii/src/ui/homepage.dart';
import 'package:online_learning_huweii/src/ui/message_screen.dart';
import 'package:online_learning_huweii/src/ui/search_screen.dart';
import 'package:online_learning_huweii/src/ui/widgets/floating_action_button.dart';
import 'package:animations/animations.dart';

// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  MainScreen({this.selectedIndex, Key? key}) : super(key: key);
  int? selectedIndex;
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    if (index != 2) {
      setState(() {
        _selectedIndex = index;
      });
    } else {
      print('2 clicked');
    }
  }

  @override
  initState() {
    super.initState();
    if (widget.selectedIndex != null) {
      _selectedIndex = widget.selectedIndex!;
    }
  }

  Widget? getScreen(index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return CourseScreen();
      case 2:
        return SearchScreen();

      case 3:
        return MessageScreen();
      case 4:
        return ProfileScreen();
    }

    // return Container();
  }

  @override
  Widget build(BuildContext context) {
    final bool showFab = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: getScreen(_selectedIndex),
      ),
      // body: getScreen(_selectedIndex),
      floatingActionButton: showFab ? floatingActionButton() : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(30),
          //   topRight: Radius.circular(30),
          // ),
          color: Colors.transparent,
        ),
        height: Platform.isAndroid ? 80 : 100,
        // padding: EdgeInsets.only(left: 5.0, right: 5.0),
        child: Theme(
          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.white,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Colors.red,
              bottomAppBarColor: Colors.green,
              textTheme: Theme.of(context).textTheme.copyWith(
                  caption: TextStyle(
                      color: Colors
                          .grey))), // sets the inactive color of the `BottomNavigationBar`
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
                selectedItemColor: Color(0xff3D5CFF),
                unselectedItemColor: Color(0xffB8B8D2),
                selectedLabelStyle: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
                type: BottomNavigationBarType.fixed,
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                items: [
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/icon_svg/bottom_bar_home-min.svg',
                        color: _selectedIndex == 0
                            ? Color(0xff3D5CFF)
                            : Color(0xffB8B8D2),
                      ),
                      label: 'Home',
                      backgroundColor: Colors.black),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/icon_svg/bottom_bar_course-min.svg',
                      color: _selectedIndex == 1
                          ? Color(0xff3D5CFF)
                          : Color(0xffB8B8D2),
                    ),
                    label: 'Course',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.bookmark_border,
                        color: Colors.transparent,
                      ),
                      label: 'Search'),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/icon_svg/bottom_bar_message-min.svg',
                        color: _selectedIndex == 3
                            ? Color(0xff3D5CFF)
                            : Color(0xffB8B8D2),
                      ),
                      label: 'Message'),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        'assets/icon_svg/bottom_bar_account-min.svg',
                        color: _selectedIndex == 4
                            ? Color(0xff3D5CFF)
                            : Color(0xffB8B8D2),
                      ),
                      label: 'Account'),
                ]),
          ),
        ),
      ),
      extendBody: true,
    );
  }
}
