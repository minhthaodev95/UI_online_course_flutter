import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_learning_huweii/sample_data/ads_card.dart';
import 'package:online_learning_huweii/sample_data/course_data.dart';
import 'package:online_learning_huweii/src/ui/widgets/custom_card.dart';
import 'package:online_learning_huweii/src/ui/widgets/search_widget.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({Key? key}) : super(key: key);
  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, top: 50.0, bottom: 00),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Course',
                      style: TextStyle(
                        color: Color(0xff1F1F39),
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.transparent,
                      child: ClipOval(
                        child: SvgPicture.asset(
                            'assets/image_svg/avatar_icon-min.svg',
                            fit: BoxFit.cover),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16.0),
                SearchWidget(controller: _controller),
                SizedBox(
                  height: 108,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 15.0),
                        width: 160,
                        child: Stack(children: [
                          Positioned(
                            top: 30,
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(
                                      listAdsCard[index].backgroundColor)),
                            ),
                          ),
                          Positioned(
                            child: SvgPicture.asset(listAdsCard[index].imageUrl,
                                height: 108,
                                width: 109,
                                allowDrawingOutsideViewBox: true),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 0,
                            child: Container(
                              height: 23.91,
                              padding: EdgeInsets.only(left: 7.29, right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)),
                                color: Colors.white,
                              ),
                              child: Center(
                                  child: Text(listAdsCard[index].title,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(
                                              listAdsCard[index].titleColor)))),
                            ),
                          ),
                        ]),
                      );
                    },
                    itemCount: listAdsCard.length,
                  ),
                ),
                SizedBox(height: 22.0),
                Text('Choice your course',
                    style: TextStyle(
                        color: Color(0xff1f1f39),
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 22.0),
                Row(
                  children: [
                    Container(
                      width: 75,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xff3D5CFF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'All',
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Container(
                      width: 75,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Color(0xff3D5CFF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Popular',
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Container(
                      width: 75,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Color(0xff3D5CFF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'New',
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 18.0),
                SizedBox(
                  // padding: EdgeInsets.only(bottom: 80),
                  height: MediaQuery.of(context).size.height / 2 < 350
                      ? 205
                      : MediaQuery.of(context).size.height / 2,
                  child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/CourseDetail',
                              arguments: {'idCourse': listCourse[index].id});
                        },
                        child: CustomCard(
                            author: listCourse[index].author,
                            title: listCourse[index].title,
                            price: listCourse[index].price,
                            time: '${listCourse[index].totalTime} hours',
                            imageUrl: listCourse[index].imageUrl),
                      );
                    },
                    itemCount: listCourse.length,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
