import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leo_anime/services/API/data_manager.dart';
import 'package:leo_anime/widgets/display_search_card.dart';

class SearchPage extends StatefulWidget {
  final DataManager dataManager;
  const SearchPage({super.key, required this.dataManager});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController textEditingController = TextEditingController();
  String animeName = '';

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(17, 20, 34, 1),
        extendBodyBehindAppBar: true,
        // Search Bar
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: const [
            Padding(
              padding: EdgeInsets.only(
                top: 15,
                right: 40,
              ),
              child: Icon(
                Icons.search,
                size: 30,
              ),
            )
          ],
          elevation: 0,
          toolbarHeight: 70.0,
          flexibleSpace: Container(
            padding: const EdgeInsets.only(top: 80.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(27, 30, 47, 1),
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: const EdgeInsets.only(
                left: 30.0,
                right: 30.0,
                top: 20.0,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Anime Name',
                    hintStyle: GoogleFonts.roboto(
                      color: const Color.fromRGBO(66, 64, 253, 1),
                      fontSize: 14.0,
                    )),
                style: GoogleFonts.roboto(
                  color: Colors.white,
                ),
                onChanged: (value) {
                  setState(() {
                    animeName = value.toLowerCase().replaceAll(' ', '-');
                  });
                },
              ),
            ),
          ),
        ),

        // Display matching Search Results
        body: FutureBuilder(
            future: widget.dataManager.searchAnime(animeName),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: data.length,
                  itemBuilder: ((context, index) {
                    return DisplaySearchCard(
                      data: data[index],
                    );
                  }),
                );
              } else {
                return const Center();
              }
            })),
      ),
    );
  }
}
