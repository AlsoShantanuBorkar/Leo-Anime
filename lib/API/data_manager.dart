import 'package:leo_anime/API/most_popular_data_model.dart';
import 'package:leo_anime/API/recent_release_data_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:leo_anime/API/trending_data_model.dart';

// Fetching and Storing Data in local storage

class DataManager {
  List<RecentRelease>? recentEpList;
  List<MostPopular>? mostPopularList;
  List<Trending>? trendingList;

  // Fetch Recently Released Anime and append to list
  fetchRecent() async {
    const url = "https://api.consumet.org/meta/anilist/recent-episodes";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      recentEpList = [];

      var data = jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> decodeData = data["results"];
      for (var json in decodeData) {
        recentEpList?.add(RecentRelease.fromJson(json));
      }
    }
  }

  //  Fetch Most Popular Anime and append to list
  fetchPopular() async {
    const url = "https://api.consumet.org/meta/anilist/popular";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      mostPopularList = [];
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> decodeData = data["results"];
      for (var json in decodeData) {
        mostPopularList?.add(MostPopular.fromJson(json));
      }
    }
  }

  // Fetch Trending Anime and append to list
  fetchTrending() async {
    const url = "https://api.consumet.org/meta/anilist/trending";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      trendingList = [];
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> decodeData = data['results'];
      for (var json in decodeData) {
        trendingList?.add(Trending.fromJson(json));
      }
    }
  }

  // Fetch searched anime and return all matching ones
  Future<List<dynamic>> searchAnime(query) async {
    String url = "https://api.consumet.org/meta/anilist/$query";
    var response = await http.get(Uri.parse(url));
    List<dynamic>? searchList = [];
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> decodeData = data['results'];
      for (var json in decodeData) {
        searchList.add(Trending.fromJson(json));
      }
    }
    return searchList;
  }

  // Getters
  Future<List<Trending>> getTrending() async {
    if (trendingList == null) await fetchTrending();
    return trendingList!;
  }

  Future<List<RecentRelease>> getRecent() async {
    if (recentEpList == null) {
      await fetchRecent();
    }
    return recentEpList!;
  }

  Future<List<MostPopular>> getPopular() async {
    if (mostPopularList == null) {
      await fetchPopular();
    }
    return mostPopularList!;
  }
}
