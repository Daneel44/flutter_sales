/**
no used

import 'package:flutter/material.dart';
import 'product_model.dart';
import 'package:go_router/go_router.dart';

class listProducts extends StatelessWidget {
  const listProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List of product'),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart_checkout),
              color: Colors.green,
              onPressed: () => GoRouter.of(context).go('/cart'),
            )
          ],
        ),
        body: ListView.builder(
            itemCount: lsProducts.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: ListTile(
                onTap: () => GoRouter.of(context)
                    .go('/detail', extra: lsProducts[index]),
                title: Text(lsProducts[index].name),
                subtitle: Text('${lsProducts[index].price} €',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black)),
                leading: Hero(
                    tag: lsProducts[index].id,
                    child: Image.network(lsProducts[index].image,
                        width: 80, height: 80)),
                trailing: const Icon(Icons.shopping_cart_checkout),
              ));
            }));
  }
}*/
