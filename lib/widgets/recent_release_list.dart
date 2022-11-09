import 'package:flutter/material.dart';
import 'package:leo_anime/models/recent_release_data_model.dart';
import 'package:leo_anime/services/API/data_manager.dart';
import 'package:provider/provider.dart';

import '../providers/api_provider.dart';
import '../widgets/display_large_item.dart';

class RecentReleaseList extends StatefulWidget {
  final DataManager dataManager;
  const RecentReleaseList({super.key, required this.dataManager});

  @override
  State<RecentReleaseList> createState() => _RecentReleaseListState();
}

class _RecentReleaseListState extends State<RecentReleaseList> {
  @override
  Widget build(BuildContext context) {
    {
      return SizedBox(
        height: 280,
        child: Consumer<ApiProvider>(
          builder: ((context, provider, child) {
            final List<RecentRelease> recentReleaseAnime =
                provider.recentEpList;
            if (recentReleaseAnime.isNotEmpty) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: recentReleaseAnime.length,
                itemBuilder: ((context, index) {
                  return DisplayCard(
                    data: recentReleaseAnime[index],
                  );
                }),
              );
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
          }),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ApiProvider>(context, listen: false).recentRelease();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
