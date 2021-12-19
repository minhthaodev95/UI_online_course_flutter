import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_learning_huweii/src/ui/widgets/bottom_modal_sheet.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    required TextEditingController controller,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 50.0,
      child: TextFormField(
        controller: _controller,
        style: const TextStyle(
            fontSize: 18.0, fontFamily: "Roboto", color: Color(0xff727EE0)),
        decoration: InputDecoration(
          // isCollapsed: true,
          contentPadding: const EdgeInsets.all(0),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          filled: true,
          fillColor: const Color(0xffE0DEDE),
          hintText: "Find Course",
          hintStyle: const TextStyle(fontSize: 18.0, color: Color(0xffB8B8D2)),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Tính năng này hiện chưa khả dụng !!'),
                        ],
                      ),
                      backgroundColor: Colors.blue[600],
                    ),
                  );
                },
                child: SvgPicture.asset('assets/icon_svg/search-min.svg',
                    color: Color(0xffB8B8D2))),
          ),
          // suffix: GestureDetector(
          //   onTap: () {},
          //   child: SvgPicture.asset(
          //     'assets/icon_svg/suffix.svg',
          //     color: Color(0xffB8B8D2),
          //   ),
          // ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
                onTap: () {
                  showModalBottomSheet<void>(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return BottomModalSheet();
                      });
                },
                child: SvgPicture.asset('assets/icon_svg/filter-min.svg',
                    color: Color(0xffB8B8D2))),
          ),
        ),
        maxLines: 1,
        textAlign: TextAlign.start,
      ),
    );
  }
}
