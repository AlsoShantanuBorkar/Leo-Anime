import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:leo_anime/models/most_popular_data_model.dart';
import 'package:leo_anime/models/recent_release_data_model.dart';
import 'package:leo_anime/models/trending_data_model.dart';

// Fetching and Storing Data in local storage

class DataManager {
  // Fetch Recently Released Anime and append to list
  Future<List<RecentRelease>?> fetchRecent() async {
    final Uri url =
        Uri.parse("https://api.consumet.org/meta/anilist/recent-episodes");

    List<dynamic> decodeData = await _makeGetRequest(() async {
      var response = await http.get(url);
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      return data['results'];
    });
    final List<RecentRelease> recentEpList = [];
    for (var json in decodeData) {
      recentEpList.add(RecentRelease.fromJson(json));
    }
    return recentEpList;
  }

  //  Fetch Most Popular Anime and append to list
  Future<List<MostPopular>?> fetchPopular() async {
    final Uri url = Uri.parse("https://api.consumet.org/meta/anilist/popular");

    List<dynamic> decodeData = await _makeGetRequest(() async {
      var response = await http.get(url);
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      return data['results'];
    });
    final List<MostPopular> mostPopularList = [];
    for (var json in decodeData) {
      mostPopularList.add(MostPopular.fromJson(json));
    }
    return mostPopularList;
  }

  // Fetch Trending Anime and append to list
  Future<List<Trending>?> fetchTrending() async {
    final Uri url = Uri.parse("https://api.consumet.org/meta/anilist/trending");
    List<dynamic> decodeData = await _makeGetRequest(() async {
      var response = await http.get(url);
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      return data['results'];
    });
    final List<Trending> trendingList = [];
    for (var json in decodeData) {
      trendingList.add(Trending.fromJson(json));
    }
    return trendingList;
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

  Future _makeGetRequest(Function request) async {
    try {
      return await request();
    } on SocketException catch (_) {
      throw 'Error whilst getting the data: no internet connection.';
    } on HttpException catch (_) {
      throw 'Error whilst getting the data: requested data could not be found.';
    } on FormatException catch (_) {
      throw 'Error whilst getting the data: bad format.';
    } on TimeoutException catch (_) {
      throw 'Error whilst getting the data: connection timed out.';
    } catch (err) {
      throw 'An error occurred whilst fetching the requested data: $err';
    }
  }
}
