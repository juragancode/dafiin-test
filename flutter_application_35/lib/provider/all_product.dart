import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_35/models/product.dart';

class Products with ChangeNotifier {
  List<Product> _allproducts =
    List.generate(
    25,
    (index) {
      return Product(
        id: "id_${index + 1}",
        title: "Product ${index + 1}",
        description: 'Ini adalah deskripsi produk ${index + 1}',
        price: 10000 + Random().nextInt(1000000),
        imageUrl: 'https://picsum.photos/id/$index/200/300',
      );
    },
  );
  

  List<Product> get allproducts {
    return [..._allproducts];
  }

  Product findById(productId){
    return _allproducts.firstWhere((prodId) => prodId.id == productId);
  }
  // void addProduct() {
  //   _allproducts.add(value);
  //   notifyListeners();
  // }
}
