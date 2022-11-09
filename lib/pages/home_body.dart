import 'package:flutter/material.dart';
import 'package:leo_anime/services/API/data_manager.dart';
import 'package:leo_anime/widgets/most_popular_list.dart';
import 'package:leo_anime/widgets/recent_release_list.dart';
import 'package:leo_anime/widgets/trending_list.dart';

class HomeBody extends StatelessWidget {
  final DataManager dataManager;
  const HomeBody({super.key, required this.dataManager});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        shrinkWrap: false,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Recent Releases",
              style: TextStyle(
                  color: Colors.white, fontSize: 25, letterSpacing: 2),
            ),
          ),
          RecentReleaseList(
            dataManager: dataManager,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Most Popular",
              style: TextStyle(
                  color: Colors.white, fontSize: 25, letterSpacing: 2),
            ),
          ),
          MostPopularList(
            dataManager: dataManager,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Trending",
              style: TextStyle(
                  color: Colors.white, fontSize: 25, letterSpacing: 2),
            ),
          ),
          TrendingList(
            dataManager: dataManager,
          ),
        ],
      ),
    );
  }
}
