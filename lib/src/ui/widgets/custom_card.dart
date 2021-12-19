import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CustomCard(
      {required this.author,
      required this.title,
      this.imageUrl,
      required this.price,
      required this.time});
  final String title;
  final String author;
  final String? imageUrl;
  final int price;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(14.0),
        height: 101,
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imageUrl!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.green,
                ),
                height: 68.0,
                width: 68.0,
              ),
            ),
            SizedBox(width: 35.0),
            Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff1F1F39))),
                    Row(
                      children: [
                        Icon(Icons.person, color: Color(0xffB8B8D2), size: 12),
                        const SizedBox(width: 4.0),
                        Text(
                          author,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Color(0xffB8B8D2),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '\$$price',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff3D5CFF),
                          ),
                        ),
                        const SizedBox(width: 6.0),
                        Container(
                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red[100]),
                          child: Center(
                            child: Text(
                              time,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                color: Color(0xffff6905),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ))
          ],
        ));
  }
}
