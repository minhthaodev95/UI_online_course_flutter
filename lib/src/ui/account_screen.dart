import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextStyle style1 = TextStyle(
    fontFamily: 'Poppins',
    color: Color(0xff1f1f39),
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: EdgeInsets.only(top: 16, left: 20, right: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Account',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xff1f1f39),
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    )),
                SizedBox(height: 18.0),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 64.0,
                    height: 64.0,
                    child: Stack(children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundColor: Colors.transparent,
                        child: ClipOval(
                          child: SvgPicture.asset(
                              'assets/image_svg/avatar_icon-min.svg',
                              width: 64,
                              height: 64),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: GestureDetector(
                            onTap: () {},
                            child:
                                SvgPicture.asset('assets/icon_svg/camera.svg')),
                      ),
                    ]),
                  ),
                ),
                SizedBox(height: 24.0),
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    height: 48,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Favourite', style: style1),
                          Transform.rotate(
                            angle: 180 * math.pi / 180,
                            child: SvgPicture.asset(
                              'assets/icon_svg/back-min.svg',
                              width: 16,
                              height: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.0),
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    height: 48,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Edit Account', style: style1),
                          Transform.rotate(
                            angle: 180 * math.pi / 180,
                            child: SvgPicture.asset(
                              'assets/icon_svg/back-min.svg',
                              width: 16,
                              height: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.0),
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    height: 48,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Setting and Privacy', style: style1),
                          Transform.rotate(
                            angle: 180 * math.pi / 180,
                            child: SvgPicture.asset(
                              'assets/icon_svg/back-min.svg',
                              width: 16,
                              height: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.0),
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    height: 48,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Help', style: style1),
                          Transform.rotate(
                            angle: 180 * math.pi / 180,
                            child: SvgPicture.asset(
                              'assets/icon_svg/back-min.svg',
                              width: 16,
                              height: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.0),
              ],
            )),
        //
      ),
    );
  }
}
