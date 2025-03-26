import 'package:flutter/material.dart';

class Posttile extends StatelessWidget {
  const Posttile({super.key, required this.userId, required this.textcontext});

  final int userId;
  final String textcontext;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.white)),
      height: 440,
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 20),
              SizedBox(width: 5),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userId.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("회원님을 위한 추천", style: TextStyle(fontSize: 12)),
                ],
              ),
            ],
          ),
          SizedBox(height: 4),
          Image.network(
            width: 500,
            height: 300,
            fit: BoxFit.fill,
            "https://www.shutterstock.com/image-illustration/earth-size-1024x1024-scale200-modern-260nw-1306931020.jpg",
          ), // toString()을 사용하여 int를 String으로 변환
          Row(
            children: [
              Icon(Icons.heart_broken_outlined, size: 30),
              Text(
                "213",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              Icon(Icons.comment_outlined, size: 30),
              Text(
                "8",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              Icon(Icons.share_outlined, size: 30),
              Text(
                "154",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 5),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  "USERID",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),
              SizedBox(width: 10),
              Expanded(child: Text(textcontext, softWrap: true)),
            ],
          ),
        ],
      ),
    );
  }
}
