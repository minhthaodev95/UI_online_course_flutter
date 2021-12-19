import 'package:flutter/material.dart';
import 'package:online_learning_huweii/src/configs/theme/app_theme.dart';

class CustomArticleVideo extends StatelessWidget {
  final String title;
  final String time;
  final bool completed;
  final int index;
  final bool? isPlaying;
  final bool? isBlocked;

  // ignore: use_key_in_widget_constructors
  const CustomArticleVideo({
    required this.title,
    required this.time,
    required this.completed,
    required this.index,
    this.isPlaying,
    this.isBlocked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      width: 40,
      height: 54,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: SizedBox(
              width: 36,
              height: 48,
              child: Center(
                child: index < 10
                    ? Text(
                        '0$index',
                        style: TextStyle(
                            color: Color(0xffB8B8D2),
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      )
                    : Text('$index'),
              ),
            ),
          ),
          Flexible(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.colors.text1,
                      fontWeight: FontWeight.w500,
                    )),
                Row(
                  children: [
                    Text('$time mins',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: completed
                                ? Color(0xff3D5CFF)
                                : Color(0xffB8B8D2))),
                    SizedBox(width: 8),
                    if (completed)
                      Icon(
                        Icons.check_circle,
                        size: 12,
                        color: Color(0xff3D5CFF),
                      ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundColor: isBlocked != null
                  ? Color(0xff3D5CFF).withOpacity(0.25)
                  : Color(0xff3D5CFF),
              child: Center(
                child: isBlocked != null
                    ? Icon(Icons.lock, color: Colors.white)
                    : isPlaying != null
                        ? Icon(Icons.pause, color: Colors.white)
                        : Icon(Icons.play_arrow_rounded, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
