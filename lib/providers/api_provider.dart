import 'package:flutter/cupertino.dart';
import 'package:leo_anime/models/most_popular_data_model.dart';
import 'package:leo_anime/models/recent_release_data_model.dart';
import 'package:leo_anime/models/trending_data_model.dart';
import 'package:leo_anime/services/API/data_manager.dart';

class ApiProvider extends ChangeNotifier {
  final DataManager consumetApi = DataManager();
  bool isLoading = false;

  List<RecentRelease> _recentEpList = [];
  List<RecentRelease> get recentEpList => _recentEpList;

  List<MostPopular> _mostPopularList = [];
  List<MostPopular> get mostPopularList => _mostPopularList;

  List<Trending> _trendingList = [];
  List<Trending> get trendingList => _trendingList;

  Future<void> mostPopular() async {
    isLoading = true;
    notifyListeners();

    final List<MostPopular>? results = await consumetApi.fetchPopular();
    _mostPopularList = results!;
    isLoading = true;
    notifyListeners();
  }

  Future<void> recentRelease() async {
    isLoading = true;
    notifyListeners();

    final List<RecentRelease>? results = await consumetApi.fetchRecent();
    _recentEpList = results!;
    isLoading = true;
    notifyListeners();
  }

  Future<void> trending() async {
    isLoading = true;
    notifyListeners();

    final List<Trending>? results = await consumetApi.fetchTrending();
    _trendingList = results!;
    isLoading = true;
    notifyListeners();
  }
}
