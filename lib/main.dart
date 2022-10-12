import 'package:flutter/material.dart';
import 'package:flutter_sales/details_page.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';
import 'list_page.dart';
import 'reviewPage.dart';
import 'product_model.dart';
import 'cart_model.dart';
import 'review_model.dart';

final GoRouter _router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const listProducts();
        },
        routes: [
          GoRoute(
            path: 'cart',
            builder: (BuildContext context, GoRouterState state) {
              return const CartPage();
            },
          ),
          GoRoute(
              path: 'detail',
              builder: (BuildContext context, GoRouterState state) {
                return detail(state.extra as Product);
              },
              routes: [
                GoRoute(
                    path: 'review',
                    builder: (BuildContext context, GoRouterState state) {
                      return ReviewPage(state.extra as Product);
                    })
              ]),
        ]),
  ],
);

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<Cart>(create: (_) => Cart()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}
