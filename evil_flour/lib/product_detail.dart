import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.productId});

  final String productId; // idetify the product

  @override
  Widget build(BuildContext context) {
    // TODO retrieve product details from db

    // Construct the route
    return Scaffold(
        appBar: AppBar(title: const Text("Prodotto"), centerTitle: true),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Product id $productId'),
            ElevatedButton(
              onPressed: () {
                // Navigate back to first route when tapped.
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
          ],
        ));
  }
}
