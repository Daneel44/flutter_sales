import 'package:flutter/material.dart';
import 'product_model.dart';
import 'package:go_router/go_router.dart';

class detail extends StatelessWidget {
  final Product product;
  const detail(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(product.name)),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
                tag: product.id,
                child: Image.network(
                  product.image,
                  scale: 7,
                )),
            Center(child: Text(product.name)),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Description',
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                      onPressed: () => context.go('/review', extra: product),
                      child: Text(
                        'Reviews',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ))),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Card(child: Text(product.reviews[0].avis))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Category',
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Text(product.category)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Price : ${product.price} €',
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )),
            ),
          ],
        ));
  }
}
