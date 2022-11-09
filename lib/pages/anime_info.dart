// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:leo_anime/widgets/scrollable_app_bar.dart';

class InfoPage extends StatefulWidget {
  String? description;
  final String id;
  final String title;
  InfoPage({super.key, required this.id, required this.title});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  ScrollController _scrollController = ScrollController();

  bool lastStatus = true;

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  bool get isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (200 - kToolbarHeight);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
        future: http.get(Uri.parse(
            'https://api.consumet.org/meta/anilist/info/${widget.id}')),
        builder: ((context, response) {
          if (response.hasData) {
            var animeData = jsonDecode(response.data!.body);
            var description = animeData['description'];
            description ??= "No Description";
            description = description.replaceAll("<br>", "\n");
            description = description.replaceAll("<i>", " ");
            description = description.replaceAll("</i>", " ");
            return Scaffold(
              extendBodyBehindAppBar: true,
              backgroundColor: const Color.fromRGBO(17, 20, 34, 1),
              body: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  ScrollableAppBar(imageUrl: animeData["image"]),
                  SliverAppBar(
                    toolbarHeight: 60,
                    automaticallyImplyLeading: false,
                    pinned: true,
                    centerTitle: true,
                    backgroundColor: isShrink
                        ? const Color.fromRGBO(27, 30, 47, 1)
                        : const Color.fromRGBO(0, 0, 0, 0),
                    title: Text(widget.title,
                        style: GoogleFonts.outfit(
                            letterSpacing: 2,
                            color: Colors.white,
                            fontSize: 30)),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 12),
                      child: Text(
                        description,
                        style: GoogleFonts.roboto(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                ],
              ),
            );
          }
        }));
  }
}
