import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_learning_huweii/src/configs/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 0,
            bottom: 0,
          ),
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(color: Color(0xFF3D5CFF)),
                height: MediaQuery.of(context).size.height + 100,
                width: double.infinity,
                padding: EdgeInsets.only(
                  top: 40.0,
                  left: 20.0,
                  right: 20.0,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hi, Minh Thao',
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: AppTheme.colors.white,
                            ),
                          ),
                          CircleAvatar(
                            radius: 18,
                            backgroundColor: AppTheme.colors.githubColor,
                            child: ClipOval(
                              child: SvgPicture.asset(
                                  'assets/image_svg/avatar_icon-min.svg',
                                  fit: BoxFit.cover),
                            ),
                          )
                        ],
                      ),
                      Text(
                        'Let’s start learning',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: AppTheme.colors.white,
                        ),
                      ),
                    ]),
              ),
              Positioned(
                top: 180,
                left: 0,
                right: 0,
                child: Container(
                    padding: EdgeInsets.only(top: 200),
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LearningPlanWidget(),
                        MeetupWidget(),
                      ],
                    )),
              ),
              Positioned(
                top: 120,
                left: 20,
                right: 20,
                child: Container(
                  padding: EdgeInsets.only(
                      top: 10, bottom: 10, left: 15.0, right: 15.0),
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    // boxShadow: const [
                    //   BoxShadow(
                    //     color: Colors.grey,
                    //     offset: Offset(0.0, 1.0), //(x,y)
                    //     blurRadius: 6.0,
                    //   ),
                    // ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Learn Today',
                              style: TextStyle(
                                  color: Color(0xff858597), fontSize: 12)),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/MainScreen',
                                  arguments: {'selectedIndex': 1});
                            },
                            child: Text(
                              'My Courses',
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff3D5CFF)),
                            ),
                          )
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          text: '46 min',
                          style: TextStyle(
                              color: Color(0xff1F1F39),
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500),
                          children: const <TextSpan>[
                            TextSpan(
                                text: ' / ',
                                style: TextStyle(
                                  color: Color(0xff858597),
                                )), //
                            TextSpan(
                              text: '60 min',
                              style: TextStyle(
                                  color: Color(0xff858597), fontSize: 10.0),
                            ), //
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 6.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 6.0,
                              width: 255,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment(0.8,
                                      0.0), // 10% of the width, so there are ten blinds.
                                  colors: const <Color>[
                                    Color(0xffFFFFFF),
                                    Color(0xffFF5106)
                                  ], // red to yellow
                                  // repeats the gradient over the canvas
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 210,
                // bottom: 180,
                left: 0,
                right: 0,
                child: Container(
                  height: 154,
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(20),
                      // color: Colors.red,
                      ),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      AdsCard01(),
                      AdsCard02(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget LearningPlanWidget() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 0.5), //(x,y)
            blurRadius: 3.0,
          ),
        ],
      ),
      padding: EdgeInsets.only(top: 14, bottom: 14, left: 20, right: 20),
      height: 180,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Learning Plan',
            style: TextStyle(
                color: Color(0xff1F1F39),
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
          SizedBox(
            height: 120.0,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(0),
              itemExtent: 35.0,
              itemBuilder: (context, index) {
                return ListTile(
                  // dense: true,
                  horizontalTitleGap: 10,
                  minLeadingWidth: 0,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                  leading: FlutterLogo(),
                  title: Text(
                    'Product Design',
                    style: TextStyle(
                      color: Color(0xff1F1F39),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: RichText(
                    text: TextSpan(
                      text: '40',
                      style: TextStyle(
                        color: Color(0xff1F1F39),
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                            text: '/',
                            style: TextStyle(
                              color: Color(0xffB8B8D2),
                            )), //
                        TextSpan(
                          text: '48',
                          style: TextStyle(
                              color: Color(0xffB8B8D2), fontSize: 14.0),
                        ), //
                      ],
                    ),
                  ),
                );
              },
              itemCount: 3,
            ),
          )
        ],
      ),
    );
  }

  // Widget Component
  Widget AdsCard02() {
    return Container(
        padding: EdgeInsets.only(top: 20, left: 0, bottom: 10, right: 40),
        margin: EdgeInsets.only(right: 12),
        width: 249,
        height: 154,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffCEECFE),
        ),
        child: SvgPicture.asset('assets/image_svg/home_icon02-min.svg'));
  }

  Widget AdsCard01() {
    return Container(
        padding: const EdgeInsets.only(top: 10.0, left: 15.0, bottom: 7.0),
        margin: EdgeInsets.only(right: 12),
        width: 249,
        height: 154,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffCEECFE),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 135,
                  // height: 76,r
                  child: Text(
                    'What do you want to learn today?',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1F1F39),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // maximumSize: Size(85, 31),
                      primary: const Color(0xFFFF6905),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ))
              ],
            ),
            Flexible(
              flex: 1,
              child: SvgPicture.asset('assets/image_svg/home_icon01-min.svg'),
            )
          ],
        ));
  }
}

class MeetupWidget extends StatelessWidget {
  const MeetupWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 14, left: 20, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffEFE0FF),
          // boxShadow: const [
          //   BoxShadow(
          //     color: Colors.grey,
          //     offset: Offset(0.0, 0.5), //(x,y)
          //     blurRadius: 3.0,
          //   ),
          // ],
        ),
        padding: EdgeInsets.only(top: 14, bottom: 14, left: 20, right: 20),
        height: 120,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Meetup',
                    style: TextStyle(
                      color: Color(0xff440687),
                      fontSize: 24.36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Off-line exchange of learning experiences',
                    style: TextStyle(fontSize: 12, color: Color(0xff440687)),
                  ),
                ],
              ),
            ),
            Flexible(
                flex: 1,
                child: Center(
                  child: SvgPicture.asset(
                      'assets/image_svg/home_person01-min.svg'),
                ))
          ],
        ));
  }
}
