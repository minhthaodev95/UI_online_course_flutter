import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: camel_case_types
class floatingActionButton extends StatefulWidget {
  const floatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  State<floatingActionButton> createState() => _floatingActionButtonState();
}

// ignore: camel_case_types
class _floatingActionButtonState extends State<floatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25),
      child: SizedBox(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          splashColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          focusElevation: 0,
          elevation: 0,
          isExtended: true,
          highlightElevation: 0,
          onPressed: () {
            Navigator.pushNamed(context, '/MainScreen',
                arguments: {'selectedIndex': 2});
          },
          child: Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 5),
                shape: BoxShape.circle,
                color: Color(0xffE7E5F9)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SvgPicture.asset(
                'assets/icon_svg/bottom_bar_search-min.svg',
                color: Color(0xff3D5CFF),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
