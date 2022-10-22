import 'package:flutter/material.dart';
import 'package:leo_anime/API/data_manager.dart';
import 'package:leo_anime/components/app_bar.dart';
import 'package:leo_anime/pages/home_body.dart';
import 'package:leo_anime/pages/search_page.dart';


// HomePage consisting of Home, Search and Bookmarks.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DataManager dataManager = DataManager();
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget? currentWidget;


    // Change Scaffold Body according to the Selected Index
    switch (selectedIndex) {
      case 0:
        currentWidget = HomeBody(dataManager: dataManager);
        break;
      case 1:
        currentWidget = SearchPage(dataManager: dataManager);
        break;
      case 2:
        currentWidget = const Text("Bookmarks");
        break;
    }

    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: const Color.fromRGBO(17, 20, 34, 1),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppBar(title: widget.title)),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromRGBO(27, 30, 47, 1),
          unselectedItemColor: const Color.fromRGBO(66, 64, 253, 1),
          selectedItemColor: Colors.white,
          currentIndex: selectedIndex,
          onTap: (newIndex) {
            setState(() {
              selectedIndex = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: "Bookmark",
              icon: Icon(Icons.bookmark_border),
            ),
          ],
        ),
        body: currentWidget);
  }
}
