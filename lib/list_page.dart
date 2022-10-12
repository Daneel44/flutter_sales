import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sales/cart_model.dart';
import 'package:http/http.dart' as http;
import 'product_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class listProducts extends StatefulWidget {
  const listProducts({super.key});
  @override
  _ListProductsState createState() => new _ListProductsState();
}

class _ListProductsState extends State<listProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List of product'),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_basket),
              color: Colors.green,
              onPressed: () => GoRouter.of(context).go('/cart'),
            )
          ],
        ),
        body: FutureBuilder<http.Response>(
            future: http.get(Uri.parse('https://fakestoreapi.com/products/')),
            builder: (_, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                String body = snapshot.data!.body;
                List<Product> lsProducts = (jsonDecode(body) as List)
                    .map((e) => Product.fromJson(e))
                    .toList();
                return ListView.builder(
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
                        trailing: IconButton(
                            onPressed: () {
                              context.read<Cart>().addToCart(lsProducts[index]);
                            },
                            icon: const Icon(Icons.shopping_cart_checkout)),
                      ));
                    });
              }
              return const CircularProgressIndicator();
            }));
  }
}
