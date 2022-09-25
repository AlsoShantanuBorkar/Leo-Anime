import 'package:flutter/material.dart';

class DisplayPage extends StatelessWidget {
  final data;
  const DisplayPage({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00000000),
        appBar: AppBar(
          title:  Text(
            data.title.english,
            style: const TextStyle(
              color: Color.fromARGB(245, 255, 255, 255),
              letterSpacing: 4,
              
            ),
            textAlign: TextAlign.justify,
          ),
        ),
    );
  }
}