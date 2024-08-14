import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.sizeOf(context).width;
    double deviceHeight = MediaQuery.sizeOf(context).height;
    return Container(
      width: deviceWidth,
      height: deviceHeight / 3,
      decoration: BoxDecoration(
        color: Colors.pink[100],
        image: const DecorationImage(
          image: AssetImage("lib/assets/images/Header (6).png"),
          fit: BoxFit.cover,
        ),
      ),
      child: const Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "August 2, 2024",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
          Padding(
              padding: EdgeInsets.only(top: 35),
              child: Text(
                "My Todo List",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
