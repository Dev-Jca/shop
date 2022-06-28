import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/products_provider.dart';

class ProductsDetailScreen extends StatelessWidget {
  static const routeName = '/product_detail_screen';
  const ProductsDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: Container(
          // decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(url))),
          ),
    );
  }
}
