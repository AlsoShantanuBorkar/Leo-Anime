import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class DisplayLargeItem extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;
  String? title;
  DisplayLargeItem({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    title = data.title.english;
    title ??= data.title.romaji;
    return SizedBox(
      width: 250,
      child: Card(
        color: const Color.fromRGBO(31, 31, 31, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
              child: InkWell(
                  child: Image(
                width: 300,
                height: 200,
                fit: BoxFit.fitWidth,
                image: NetworkImage(data.image, scale: 2),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                title!,
                softWrap: true,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: GoogleFonts.fuzzyBubbles(
                  color: Colors.lightBlue,
                  fontSize: 18,
                  letterSpacing: 2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
