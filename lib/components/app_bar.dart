import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: AppBar(
        iconTheme: const IconThemeData(color: Colors.lightBlue) ,
            elevation: 10,
            centerTitle: true,
            backgroundColor: const Color.fromRGBO(31, 31, 31, 1),
            shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            title: Text(
              title,
              style: const TextStyle(
                letterSpacing: 4,
                color: Colors.lightBlue,
              ),
            ),
          ),
    );
  }
}