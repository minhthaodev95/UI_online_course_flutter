import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_learning_huweii/sample_data/course_data.dart';
import 'package:online_learning_huweii/src/configs/theme/app_theme.dart';
import 'package:online_learning_huweii/src/ui/widgets/custom_card.dart';
import 'package:online_learning_huweii/src/ui/widgets/search_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  List<String> listCategoriesHis = [
    'Painting',
    'Coding',
    'Visual identiy',
    'Writing'
  ];
  List<String> listCategoriesHisChoiced = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset('assets/icon_svg/back-min.svg',
                width: 24, height: 24),
          ),
        ),
        // title: Text('Search Screen'),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchWidget(controller: _controller),
              const SizedBox(height: 10),
              Container(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                height: 45,
                padding: EdgeInsets.all(0),
                margin: EdgeInsets.all(0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listCategoriesHis.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (!listCategoriesHisChoiced
                              .contains(listCategoriesHis[index])) {
                            listCategoriesHisChoiced.clear();
                            _controller.text = listCategoriesHis[index];
                            listCategoriesHisChoiced
                                .add(listCategoriesHis[index]);
                          } else {
                            listCategoriesHisChoiced.clear();
                            _controller.text = '';
                          }
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.only(
                              top: 8, left: 12, bottom: 8, right: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: listCategoriesHisChoiced
                                    .contains(listCategoriesHis[index])
                                ? Color(0xff3D5CFF)
                                : Color(0xffDEDCF1).withOpacity(0.8),
                          ),
                          margin: EdgeInsets.only(right: 10, bottom: 10),
                          child: Center(
                            child: Text(
                              listCategoriesHis[index],
                              style: TextStyle(
                                fontSize: 12,
                                color: listCategoriesHisChoiced
                                        .contains(listCategoriesHis[index])
                                    ? Color(0xffffffff)
                                    : Color(0xff858597),
                              ),
                            ),
                          )),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Text('Results',
                  style: TextStyle(
                      color: AppTheme.colors.text1,
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
              Container(
                padding: EdgeInsets.all(8),
                height: 500,
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
      ),
    );
  }
}
