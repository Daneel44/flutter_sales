import 'package:flutter/material.dart';
import 'product_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewPage extends StatelessWidget {
  final Product product;
  const ReviewPage(this.product, {super.key, Key? akey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Review for ${product.name}')),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Image.network(
            product.reviews[0].profilePicture,
            scale: 7,
          ),
          Center(child: Text(product.reviews[0].avis)),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Rate',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
          ),
          Card(
              margin: const EdgeInsets.all(8.0),
              child: Text(product.description)),
        ]));
  }
}
