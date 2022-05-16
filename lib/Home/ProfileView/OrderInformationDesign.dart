import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderInformationDesign extends StatelessWidget {
  String productName, imgUrl;
  int quantity;
  double price;

  OrderInformationDesign(
      this.productName, this.quantity, this.price, this.imgUrl);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(imgUrl),
                      alignment: Alignment.centerLeft,
                  fit: BoxFit.fill))),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$quantity QTY',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$price\$',
                    style: TextStyle(
                        color: const Color(0xFF3f88c5),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
