import 'package:flutter/material.dart';
import 'package:leo_anime/models/trending_data_model.dart';
import 'package:leo_anime/providers/api_provider.dart';
import 'package:leo_anime/services/API/data_manager.dart';
import 'package:provider/provider.dart';

import '../widgets/display_large_item.dart';

class TrendingList extends StatefulWidget {
  final DataManager dataManager;
  const TrendingList({super.key, required this.dataManager});

  @override
  State<TrendingList> createState() => _TrendingListState();
}

class _TrendingListState extends State<TrendingList> {
  @override
  Widget build(BuildContext context) {
    {
      return SizedBox(
        height: 280,
        child: Consumer<ApiProvider>(
            
            builder: ((context, provider,child) {
              List<Trending> trendingAnime = provider.trendingList;
              if (trendingAnime.isNotEmpty) {
                
                return ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: trendingAnime.length,
                itemBuilder: ((context, index) {
                  return DisplayCard(
                    data: trendingAnime[index],
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
            })),
      );
    }

  }
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ApiProvider>(context, listen: false)
          .trending();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
