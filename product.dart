import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product{
  final int id;
  final String title;
  final String price;
  final String description;
  final String category;
  final String image;
  final String rate;
  final int count;

  Product(this.id, this.title, this.price, this.description, this.category, this.image, this.rate, this.count);
  static Future<List<Product>> fetchData() async{
    String url ="https://fakestoreapi.com/products";
    var client =http.Client();
    var response = await client.get(Uri.parse(url));
    if (response.statusCode == 200){
      print('tai du lieu thanh cong');
      var result = response.body;
      var jsonData =jsonDecode(result);
      List<Product> pd = [];
      for(var item in jsonData){
        var id = item['id'];
        var title = item['title'];
        var price = item['price'].toString();
        var description = item['description'];
        var category = item['category'];
        var image = item['image'];
        var rate = item['rating']['rate'].toString();
        var count = item['rating']['count'];
        Product p = new Product(id, title, price, description, category, image, rate, count);
        pd.add(p);
      }
      return pd;
    }else{
      print('tai du lieu that bai');
      throw Exception("Loi${response.statusCode}");
    }
  }
}