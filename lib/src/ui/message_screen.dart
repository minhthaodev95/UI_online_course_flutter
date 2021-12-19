import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_learning_huweii/sample_data/messages.dart';
import 'package:online_learning_huweii/sample_data/notifications.dart';
import 'package:online_learning_huweii/src/configs/theme/app_theme.dart';
import 'package:online_learning_huweii/src/models/notificaton_model.dart';
import 'package:online_learning_huweii/src/models/notificaton_model.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBody: true,
        body: Container(
          // color: Colors.red,
          padding: EdgeInsets.only(top: 36, left: 20, right: 20, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Notifications',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xff1f1f39),
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(height: 18.0),
              TabBar(
                // These are the widgets to put in each tab in the tab bar.
                // indicatorColor: Color(0xff3D5CFF),
                // padding: EdgeInsets.all(9),
                // indicatorPadding: EdgeInsets.all(0),
                labelPadding: EdgeInsets.only(bottom: 7),
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: Color(0xff3D5CFF),
                    ),
                    insets: EdgeInsets.symmetric(horizontal: 60.0)),
                tabs: const [
                  Text(
                    'Messages',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xff1f1f39),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Notifications',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xff1f1f39),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Expanded(
                child:
                    TabBarView(children: [listMessageBody(), listNotiBody()]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget listNotiBody() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 40, left: 5, right: 5, bottom: 80),
      itemBuilder: (context, index) {
        return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 3.0,
                ),
              ],
            ),
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: listNotifications[index].type == notiType.normal
                        ? Color(0xffEAEAFF)
                        : Color(0xffFFEBF0),
                  ),
                  child: listNotifications[index].type == notiType.normal
                      ? Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SvgPicture.asset(
                            'assets/icon_svg/noti_icon02.svg',
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SvgPicture.asset(
                              'assets/icon_svg/noti_icon01.svg'),
                        ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 220,
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        strutStyle: const StrutStyle(fontSize: 12.0),
                        text: TextSpan(
                          text: listNotifications[index].title,
                          style: const TextStyle(
                              color: Color(0xff1f1f39),
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              fontFamily: 'Poppins'),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icon_svg/clock_noti.svg'),
                        const SizedBox(width: 4),
                        Text(listNotifications[index].time,
                            style: TextStyle(
                                color: Color(0xffB8B8D2), fontSize: 12)),
                      ],
                    )
                  ],
                )
              ],
            ));
      },
      itemCount: listNotifications.length,
    );
  }

  Widget listMessageBody() {
    return ListView.builder(
        padding: EdgeInsets.only(top: 40, left: 5, right: 5, bottom: 80),
        itemBuilder: (context, index) {
          return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 3.0,
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Row(children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(listMessage[index].avatarUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 13.2),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listMessage[index].nameSenter,
                            style: TextStyle(
                              color: Color(0xff1f1f39),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          listMessage[index].isOnline
                              ? Text(
                                  'Online',
                                  style: TextStyle(
                                    color: Color(0xff858597),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Text(
                                  'Offline',
                                  style: TextStyle(
                                    color: Color(0xff858597),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ]),
                    Expanded(child: Container()),
                    Text(
                      listMessage[index].time,
                      style: TextStyle(
                        color: Color(0xff858597),
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ]),
                  const SizedBox(height: 12.0),
                  SizedBox(
                    child: Text(
                      listMessage[index].message,
                      style: TextStyle(
                        color: Color(0xff858597),
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  if (listMessage[index].imageUrl != null)
                    const SizedBox(height: 12.0),
                  if (listMessage[index].imageUrl != null)
                    SizedBox(
                      // width: 100,
                      // height: 100,
                      child: Image.asset(listMessage[index].imageUrl!),
                    )
                ],
              ));
        },
        itemCount: listMessage.length);
  }
}
