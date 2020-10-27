import 'package:classified_ads/exceptions/exceptions.dart';
import 'package:classified_ads/models/categories.dart';
import 'package:classified_ads/utilities/api_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoriesApi {
  Map<String, String> headers = {'Accept': 'application/json'};

  Future<List<Categories>> fetchCategories() async {
    String url = ApiHelper.CATEGORIES;
    http.Response response = await http.get(url, headers: headers);

    switch (response.statusCode) {
      case 200:
        List<Categories> categories = [];
        var body = jsonDecode(response.body);
        for (var item in body['data']) {
          categories.add(Categories.fromJson(item));
        }
        return categories;
        break;

      case 404:
        throw ResourcesNotFound('Categories');
        break;

      default:
        return null;
        break;
    }
  }
}
