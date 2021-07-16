import 'package:flutter/material.dart';

const Color firstColor = Color(0xffF44336);
const Color secondColor = Color(0xff4CAF50);

class ProductCard extends StatelessWidget {
  final String imageURL;
  final String name;
  final String price;
  final int quantity;
  final String notifications;
  final VoidCallback onAddCartTap;
  final VoidCallback onIncTap;
  final VoidCallback onDecTap;

  final TextStyle textStyle = TextStyle(
      fontFamily: "Lato",
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Colors.grey[800]);

  ProductCard(
      {this.imageURL = "",
      this.name = "",
      this.price = "",
      required this.quantity,
      required this.notifications,
      required this.onAddCartTap,
      required this.onIncTap,
      required this.onDecTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          margin: EdgeInsets.only(right: 10, left: 10),
          duration: Duration(milliseconds: 300),
          width: 130,
          height: (notifications != null) ? 270 : 250,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 3,
                    offset: Offset(1, 1),
                    color: Colors.black.withOpacity(0.3))
              ],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8)),
              color: secondColor),
          child: Text(
            (notifications != null) ? notifications : "",
            style: textStyle.copyWith(color: Colors.white, fontSize: 12),
          ),
        ),
        Container(
          width: 150,
          height: 250,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: Offset(1, 1))
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                        image: DecorationImage(
                            image: NetworkImage(imageURL), fit: BoxFit.cover)),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Text(
                      name,
                      style: textStyle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      price,
                      style:
                          textStyle.copyWith(fontSize: 12, color: firstColor),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 140,
                    height: 30,
                    decoration:
                        BoxDecoration(border: Border.all(color: firstColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: onIncTap,
                          child: Container(
                            width: 30,
                            height: 30,
                            color: firstColor,
                            child: Icon(
                              Icons.add,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(
                          quantity.toString(),
                          style: textStyle,
                        ),
                        GestureDetector(
                          onTap: onDecTap,
                          child: Container(
                            width: 30,
                            height: 30,
                            color: firstColor,
                            child: Icon(
                              Icons.remove,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      width: 140,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: firstColor),
                        onPressed: onAddCartTap,
                        child: Icon(
                          Icons.add_shopping_cart,
                          size: 18,
                        ),
                      ))
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
