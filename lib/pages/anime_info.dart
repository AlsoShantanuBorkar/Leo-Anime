import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InfoPage extends StatefulWidget {
  final String id;
  final String title;
  const InfoPage({super.key, required this.id, required this.title});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            letterSpacing: 4,
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: FutureBuilder<http.Response>(
        future: http.get(Uri.parse(
            'https://api.consumet.org/meta/anilist/info/${widget.id}')),
        builder: ((context, response) {
          if (response.hasData) {
            var animeData = jsonDecode(response.data!.body);
            return ListView(
              children: [
                Text(
                  animeData['title']['english'] ??
                      animeData['title']['romaji'],
                  style: const TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                Image(
                  image: NetworkImage(animeData['image']),
                ),
                Text(
                  animeData['description'],
                  style: const TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        }),
      ),
    );
  }
}
