import 'package:flutter/material.dart';
import 'product_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewPage extends StatelessWidget {
  final Product product;
  const ReviewPage(this.product, {super.key, Key? akey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Review for')), body: Column());
  }
}
