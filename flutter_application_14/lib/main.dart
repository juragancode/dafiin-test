import 'package:flutter/material.dart';
import 'package:flutter_application_14/product_card.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Product Card"),
          backgroundColor: firstColor,
        ),
        body: ChangeNotifierProvider(create: (_) => ProductState(),
          child: Container(
            margin: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.topCenter,
              child: Consumer<ProductState>(
                builder: (context, productState, _) => ProductCard(
                  imageURL:
                      "https://cdn.popmama.com/content-images/post/20200516/1jpg-b5562aaeef6559f32a731a54432854b8_600xauto.jpg",
                  name: "Buah-buahan Mix 1Kg",
                  price: "Rp25.000",
                  quantity: productState.quantity,
                  notifications:(productState.quantity > 5) ? "diskon 10%" : "",
                  onAddCartTap: () {},
                  onIncTap: () {
                    productState.quantity++;
                  },
                  onDecTap: () {
                    productState.quantity--;
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductState with ChangeNotifier {
  int _quantity = 0;

  int get quantity => _quantity;
  set quantity(int newValue) {
    _quantity = newValue;
    notifyListeners();
  }
}
