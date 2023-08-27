// import 'dart:convert';
// import 'dart:async';
// import 'package:flutter/material.dart';
// import '../models/product.dart';
// import 'package:http/http.dart' as http;

// class ProductState with ChangeNotifier {
//   List<Product> _products = [];

//   Future getProducts() async {
//     String url = ('192.168.234.250:8000/get-products');
//     try {
//       http.Response response = await http.get(url as Uri, headers: {
//         'Authorization': "b0ceeb0bf1096333eac657a9a68d125fd6e2f378"
//       });
//       var data = json.decode(response.body) as List;
//       print(data);
//       List<Product> temp = [];
//       data.forEach((element) {
//         Product product = Product.fromJson(element);
//         temp.add(product);
//       });
//       _products = temp;
//       return true;
//     } catch (e) {
//       print("e getProducts");
//       print(e);
//       return false;
//     }
//   }

//   List<Product> product() {
//     return [..._products];
//   }

//   Product singleProduct(int id) {
//     return _products.firstWhere((element) => element.id == id);
//   }
// }
