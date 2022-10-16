import 'package:flutter/material.dart';
import 'package:leo_anime/API/data_manager.dart';
import 'package:leo_anime/pages/most_popular_list.dart';
import 'package:leo_anime/pages/recent_release_list.dart';

class Home extends StatelessWidget {
  final DataManager dataManager;
  const Home({super.key, required this.dataManager});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        shrinkWrap: false,
        children: [
          const Text("Recent Releases"),
          RecentReleaseList(
            dataManager: dataManager,
          ),
          MostPopularList(
            dataManager: dataManager,
          ),
          
        ],
      ),
    );
  }
}
