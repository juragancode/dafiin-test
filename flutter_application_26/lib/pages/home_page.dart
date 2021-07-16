import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_26/models/product.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  Faker faker = Faker();

  @override
  Widget build(BuildContext context) {
    List<Product> dummyData = List.generate(100, (index) {
      return Product("https://picsum.photos/id/$index/200", faker.food.dish(),
          10000 + Random().nextInt(100000), faker.lorem.sentence());
    });
    return Scaffold(
        appBar: AppBar(
          title: Text("Market Place"),
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemBuilder: (context, index) {
            return GridTile(
                footer: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        dummyData[index].judul, maxLines: 1,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      Text("Rp ${dummyData[index].harga}"),
                      Text(dummyData[index].deskripsi, maxLines: 2,),
                    ],
                  ),
                ),
                child: Image(
                  image: NetworkImage(dummyData[index].imageURL),
                ));
          },
          itemCount: dummyData.length,
        ));
  }
}
