import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomModalSheet extends StatefulWidget {
  const BottomModalSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomModalSheet> createState() => _BottomModalSheetState();
}

class _BottomModalSheetState extends State<BottomModalSheet> {
  double _startValue = 50;
  double _endValue = 100;
  List<String> listCategories = [
    'Design',
    'Painting',
    'Coding',
    'Music',
    'Visual identiy',
    'Mathmatics'
  ];
  List<String> listCategoriesChoiced = [];
  List<String> listTimeDuration = [
    '3-8 Hours',
    '8-14 Hours',
    '14-20 Hours',
    '20-24 Hours',
    '24-30 Hours'
  ];
  List<String> lilstTimeDurationChoiced = [];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15.0),
        height: MediaQuery.of(context).size.width * 1.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      'assets/icon_svg/close-min.svg',
                    ),
                  ),
                  Text(
                    'Search filter',
                    style: TextStyle(
                        color: Color(0xff1f1f39),
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(),
                ],
              ),
            ),
            // SizedBox(height: 14),
            Text(
              'Category',
              style: TextStyle(
                  color: Color(0xff1f1f39),
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 15),
            Wrap(
              children: List.generate(
                listCategories.length,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        listCategoriesChoiced.add(listCategories[index]);
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.only(
                            top: 8, left: 12, bottom: 8, right: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: listCategoriesChoiced
                                  .contains(listCategories[index])
                              ? Color(0xff3D5CFF)
                              : Color(0xffDEDCF1).withOpacity(0.8),
                        ),
                        margin: EdgeInsets.only(right: 10, bottom: 10),
                        child: Text(
                          listCategories[index],
                          style: TextStyle(
                            fontSize: 12,
                            color: listCategoriesChoiced
                                    .contains(listCategories[index])
                                ? Color(0xffffffff)
                                : Color(0xff858597),
                          ),
                        )),
                  );
                },
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Price : ($_startValue\$ - $_endValue\$)',
              style: TextStyle(
                  color: Color(0xff1f1f39),
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            SliderTheme(
              data: SliderThemeData(
                showValueIndicator: ShowValueIndicator.always,
                trackHeight: 1,
                // thumbColor: Colors.blueAccent,
                // thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
              ),
              child: RangeSlider(
                activeColor: Color(0xff3D5CFF),
                inactiveColor: Color(0xffB8B8D2),
                values: RangeValues(_startValue, _endValue),
                min: 0.0,
                max: 300.0,
                divisions: 300,
                labels: RangeLabels('$_startValue', '$_endValue'),
                onChanged: (values) {
                  setState(() {
                    _startValue = values.start.roundToDouble();
                    _endValue = values.end.roundToDouble();
                  });
                },
              ),
            ),
            SizedBox(height: 10),

            Text(
              'Duration',
              style: TextStyle(
                color: Color(0xff1f1f39),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Wrap(
              children: List.generate(
                listTimeDuration.length,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        lilstTimeDurationChoiced.add(listTimeDuration[index]);
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.only(
                            top: 8, left: 12, bottom: 8, right: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: lilstTimeDurationChoiced
                                  .contains(listTimeDuration[index])
                              ? Color(0xff3D5CFF)
                              : Color(0xffDEDCF1).withOpacity(0.8),
                        ),
                        margin: EdgeInsets.only(right: 10, bottom: 10),
                        child: Text(
                          listTimeDuration[index],
                          style: TextStyle(
                            fontSize: 11,
                            color: lilstTimeDurationChoiced
                                    .contains(listTimeDuration[index])
                                ? Color(0xffffffff)
                                : Color(0xff858597),
                          ),
                        )),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Row(
                children: [
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
                            setState(() {
                              listCategoriesChoiced.clear();
                              lilstTimeDurationChoiced.clear();
                              _startValue = 50;
                              _endValue = 100;
                            });
                          },
                          child: const Text(
                            'Clear',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Color(0xFF3D5CFF),
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
                            primary: const Color(0xFF3D5CFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Apply Filter',
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
        ));
  }
}
