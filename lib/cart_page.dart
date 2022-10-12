import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("My cart")),
          actions: [
            IconButton(
              icon: const Icon(Icons.delete_forever),
              color: Colors.green,
              onPressed: () => context.read<Cart>().removeAllFromCart(),
            )
          ],
        ),
        body: Column(children: [
          Container(
            height: 40,
            color: const Color.fromARGB(255, 101, 204, 207),
            margin: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text('Total amount :',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ],
                ),
                Column(
                  children: [
                    Text('${context.watch<Cart>().total} €',
                        key: const Key('cartState'),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ],
                )
              ],
            ),
          ),
          if (context.watch<Cart>().total == 0)
            SizedBox(
                width: 300,
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Text('My cart is currently empty !')],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.remove_shopping_cart_outlined,
                            color: Colors.green, size: 40)
                      ],
                    )
                  ],
                ))
          else
            SizedBox(
                width: 500,
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [Text('My cart contain :')],
                    ),
                    Consumer<Cart>(
                      builder: (_, cart, __) => Expanded(
                          child: ListView.builder(
                              itemCount: cart.productsInCart.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Card(
                                    child: ListTile(
                                  title: Text(cart.productsInCart[index].name),
                                  subtitle: Text(
                                      '${cart.productsInCart[index].price} €',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.black)),
                                  leading: Image.network(
                                      cart.productsInCart[index].image,
                                      width: 80,
                                      height: 80),
                                  trailing: IconButton(
                                      onPressed: () {
                                        context.read<Cart>().removeFromCart(
                                            cart.productsInCart[index]);
                                      },
                                      icon: const Icon(Icons.delete)),
                                ));
                              })),
                    )
                  ],
                ))
        ]));
  }
}
