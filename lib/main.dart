import 'package:flutter/material.dart';
import 'package:leo_anime/API/data_manager.dart';
import 'package:leo_anime/pages/most_popular_page.dart';
import 'package:leo_anime/pages/recent_release_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leo Anime',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Leo Anime'),
    );
  }
}

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

    switch (selectedIndex) {
      case 0:
        currentWidget = MostPopularPage(
          dataManager: dataManager,
        );

        break;
      case 1:
        currentWidget = RecentReleasePage(
          dataManager: dataManager,
        );
        break;
      case 2:
        currentWidget = const Text("search");
        break;
    }

    return Scaffold(
        backgroundColor: const Color(0x00000000),
        appBar: AppBar(
          title: Text(
            widget.title,
            style: const TextStyle(
              letterSpacing: 4,
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (newIndex) {
            setState(() {
              selectedIndex = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: "Most Popular",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Recent Releases",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search),
            ),
          ],
        ),
        body: currentWidget);
  }
}
