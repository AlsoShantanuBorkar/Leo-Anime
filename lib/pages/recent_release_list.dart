import 'package:flutter/material.dart';
import 'package:leo_anime/API/data_manager.dart';

import '../components/display_large_item.dart';

class RecentReleaseList extends StatelessWidget {
  final DataManager dataManager;
  const RecentReleaseList({super.key, required this.dataManager});

  @override
  Widget build(BuildContext context) {
    {
      return SizedBox(
        height: 280,
        child: FutureBuilder(
            future: dataManager.getRecent(),
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
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                  ],
                );
              }
            })),
      );
    }
  }
}
