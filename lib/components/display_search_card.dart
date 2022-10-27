import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leo_anime/pages/anime_info.dart';


// ignore: must_be_immutable
class DisplaySearchCard extends StatelessWidget {

  final dynamic data;
  String? title;
  DisplaySearchCard({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    title = data.title.english;
    title ??= data.title.romaji;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: 300,
        child: Card(
          color: const Color.fromRGBO(27, 30, 47, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: InkWell(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                InfoPage(id: data.id, title: title!),
                          ),
                        ),
                    child: Image(
                      fit: BoxFit.fitWidth,
                      width: 370,
                      image: NetworkImage(data.image, scale: 2),
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: SizedBox(
                  height: 40,
                  child: Text(
                    title!,
                    softWrap: true,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
