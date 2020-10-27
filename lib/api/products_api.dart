import 'package:classified_ads/models/product.dart';
import 'package:classified_ads/utilities/api_helper.dart';
import 'package:classified_ads/exceptions/exceptions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:convert';

class ProductsApi {
  Map<String, String> headers = {'Accept': 'application/json'};
  var status;

  Future<List<Products>> fetchProducts(int page) async {
    String url = ApiHelper.PRODUCTS + '?page=' + page.toString();
    http.Response response = await http.get(url, headers: headers);

    switch (response.statusCode) {
      case 200:
        List<Products> products = [];
        var body = jsonDecode(response.body);
        for (var item in body['data']) {
          products.add(Products.fromJson(item));
        }
        return products;
        break;

      case 404:
        throw ResourcesNotFound('Products');
        break;

      default:
        return null;
        break;
    }
  }

  Future<Products> fetchProduct(int product_id) async {
    String url = ApiHelper.PRODUCTS + product_id.toString();
    http.Response response = await http.get(url, headers: headers);

    switch (response.statusCode) {
      case 200:
        var body = jsonDecode(response.body);
        return Products.fromJson(body['data']);
        break;
      case 404:
        throw ResourcesNotFound('Product');
        break;
      default:
        return null;
        break;
    }
  }

  Future<Products> newProduct(
    String title,
    String description,
    String price,
    String category_id,
    String user_id,
  ) async {
    Map<String, String> body = {
      'title': title,
      'description': description,
      'price': price,
      'category_id': category_id,
      'user_id': user_id,
    };
    http.Response response = await http.post(
      ApiHelper.PRODUCTS_STORE,
      headers: headers,
      body: body,
    );
    status = response.body.contains('error');
    var data = json.decode(response.body);

    if (status) {
      print('data : ${data["error"]}');
    } else {
      print('data : ${data["title"]}');
    }
    switch (response.statusCode) {
      case 201:
        var body = convert.jsonDecode(response.body);
        var data = body['data'];
        print(response.statusCode);
        print(data);
        // return Products.fromJson(data);
        break;
      case 422:
        throw MissingFields();
        break;

      default:
        return null;
        break;
    }
  }
}
