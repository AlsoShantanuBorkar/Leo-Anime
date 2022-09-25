import 'package:flutter/material.dart';
import 'package:leo_anime/API/data_manager.dart';

import '../components/display_item.dart';

class RecentReleasePage extends StatelessWidget {
  final DataManager dataManager;
  const RecentReleasePage({super.key, required this.dataManager});

  @override
  Widget build(BuildContext context) {
    {
      return FutureBuilder(
          future: dataManager.getRecent(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data!;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      child: DisplayItem(
                        data: data[index],
                      ),
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
          }));
    }
  }
}
