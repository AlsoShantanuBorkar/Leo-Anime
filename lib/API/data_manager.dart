import 'package:leo_anime/API/most_popular_data_model.dart';
import 'package:leo_anime/API/recent_release_data_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:leo_anime/API/trending_data_model.dart';

class DataManager {
  List<RecentRelease>? recentEpList;
  List<MostPopular>? mostPopularList;
  List<Trending>? trendingList;
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

  fetchTrending()async{
    const url = "https://api.consumet.org/meta/anilist/trending";
    var response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
      trendingList = [];
      var data  = jsonDecode(response.body) as Map<String,dynamic>;
      List<dynamic> decodeData = data['results'];
      for(var json in decodeData){
        trendingList?.add(Trending.fromJson(json));
      }
    }
  }

  Future<List<dynamic>> searchAnime(query) async {

    String url = "https://api.consumet.org/meta/anilist/$query";
    var response = await http.get(Uri.parse(url));
    List<dynamic>?searchList =[];
    if(response.statusCode == 200){
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      List<dynamic> decodeData = data['results'];
      for(var json in decodeData){
        searchList.add(Trending.fromJson(json));
      }
    }
    return searchList;
    

  }

  Future<List<Trending>> getTrending() async {
    if(trendingList==null)await fetchTrending();
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
