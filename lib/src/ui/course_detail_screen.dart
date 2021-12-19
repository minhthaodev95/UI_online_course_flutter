import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_learning_huweii/sample_data/course_data.dart';
import 'package:online_learning_huweii/src/configs/theme/app_theme.dart';
import 'dart:math' as math;

import 'package:online_learning_huweii/src/ui/widgets/article_video.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({required this.idCourse, Key? key}) : super(key: key);
  final String idCourse;
  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    Course course =
        listCourse.where((course) => course.id == widget.idCourse).elementAt(0);
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: MediaQuery.of(context).size.height - 405,
          child: Stack(
            children: [
              Container(
                height: 405,
                color: Color(0xffFFE7EE),
              ),
              Positioned(
                bottom: 93,
                right: 0,
                child: SvgPicture.asset(
                    'assets/image_svg/course_detail01-min.svg'),
              ),
              Positioned(
                top: 102,
                left: -19,
                child: SvgPicture.asset('assets/image_svg/course_detail02.svg'),
              ),
              Positioned(
                top: 162,
                left: 20,
                child: SizedBox(
                  width: 150,
                  // height: 60,
                  child: Text(
                    course.title,
                    style: TextStyle(
                        color: AppTheme.colors.text1,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Poppins'),
                  ),
                ),
              ),
              Positioned(
                top: 124,
                left: 20,
                child: SizedBox(
                  width: 98,
                  height: 26,
                  child: SvgPicture.asset('assets/image_svg/best_seller.svg'),
                ),
              ),
              Positioned(
                top: 54,
                left: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset('assets/icon_svg/back-min.svg'),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height - 450 > 276
              ? 276
              : MediaQuery.of(context).size.height - 450,
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
              padding: EdgeInsets.only(top: 5, bottom: 0, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          course.title,
                          style: TextStyle(
                            fontSize: 20,
                            color: AppTheme.colors.text1,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '\$${course.price}.00',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppTheme.colors.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      ' ${course.totalTime}h 00min - 24 Lessons',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppTheme.colors.text2,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'About this course',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppTheme.colors.text1,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      height: selected ? 100 : 32.0,
                      curve: Curves.fastOutSlowIn,
                      child: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff9393A3),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = !selected;
                            });
                          },
                          child: Transform.rotate(
                              angle: selected
                                  ? 90 * math.pi / 180
                                  : 270 * math.pi / 180,
                              child: SvgPicture.asset(
                                'assets/icon_svg/back-min.svg',
                              ))),
                    ),
                    SizedBox(height: 10.0),
                    SizedBox(
                      height: 180,
                      child: ListView.builder(
                        padding: EdgeInsets.all(0),
                        itemBuilder: (context, index) {
                          return CustomArticleVideo(
                            title: 'Discovery',
                            time: '6:10',
                            completed: false,
                            index: index + 1,
                          );
                        },
                        itemCount: 4,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Center(
                      child: Row(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 89,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  primary: const Color(0xFFFFEBF0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  // side: BorderSide(
                                  //     color: Theme.of(context).primaryColor,
                                  //     width: 1),
                                ),
                                onPressed: () {
                                  setState(() {});
                                },
                                child: SvgPicture.asset(
                                    'assets/icon_svg/orange_star-min.svg')),
                          ),
                          const SizedBox(width: 10.0),
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
                                  onPressed: () {},
                                  child: const Text(
                                    'Buy Now',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ],
    ));
  }
}
