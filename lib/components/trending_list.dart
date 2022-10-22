import 'package:flutter/material.dart';
import 'package:leo_anime/API/data_manager.dart';

import '../components/display_large_item.dart';

class TrendingList extends StatelessWidget {
  final DataManager dataManager;
  const TrendingList({super.key, required this.dataManager});

  @override
  Widget build(BuildContext context) {
    {
      return SizedBox(
        height: 280,
        child: FutureBuilder(
            future: dataManager.getTrending(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data!;
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: ((context, index) {
                      return DisplayLargeItem(
                        data: data[index],
                      );
                    }));
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                    ],
                  ),
                );
              }
            })),
      );
    }
  }
}
