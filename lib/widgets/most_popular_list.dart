import 'package:flutter/material.dart';
import 'package:leo_anime/models/most_popular_data_model.dart';
import 'package:leo_anime/providers/api_provider.dart';
import 'package:leo_anime/services/API/data_manager.dart';
import 'package:provider/provider.dart';

import '../widgets/display_large_item.dart';

class MostPopularList extends StatefulWidget {
  final DataManager dataManager;
  const MostPopularList({super.key, required this.dataManager});

  @override
  State<MostPopularList> createState() => _MostPopularListState();
}

class _MostPopularListState extends State<MostPopularList> {
  @override
  Widget build(BuildContext context) {
    {
      return SizedBox(
        height: 280,
        child: Consumer<ApiProvider>(
          builder: ((context, provider, child) {
            List<MostPopular> mostPopularAnime = provider.mostPopularList;
            if (mostPopularAnime.isNotEmpty) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: mostPopularAnime.length,
                itemBuilder: ((context, index) {
                  return DisplayCard(
                    data: mostPopularAnime[index],
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
      Provider.of<ApiProvider>(context, listen: false).mostPopular();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
