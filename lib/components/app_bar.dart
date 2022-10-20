import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Color.fromRGBO(27, 30, 47, 1)),
      elevation: 10,
      scrolledUnderElevation: 10,
      centerTitle: true,
      backgroundColor: const Color.fromRGBO(27, 30, 47, 1),
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          letterSpacing: 4,
          color: Colors.white,
        ),
      ),
    );
  }
}
