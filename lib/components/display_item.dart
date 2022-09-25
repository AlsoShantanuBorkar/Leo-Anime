import 'package:flutter/material.dart';
import 'package:leo_anime/pages/anime_info.dart';

class DisplayItem extends StatelessWidget {
  final data;
  const DisplayItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(10),
      child: Card(
        color: const Color.fromARGB(255, 180, 180, 180),
        elevation: 10,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => InfoPage(id: data.id,title: data.title.english,),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
                child: Image(
                  image: NetworkImage(data.image),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 2, right: 2, top: 15, bottom: 15),
              child: Text(
                data.title.english,
                style: const TextStyle(letterSpacing: 2),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
