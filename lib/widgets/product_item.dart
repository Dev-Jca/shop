import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/screens/product_detail_screen.dart';

import '../models/product_provider.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // const ProductItem(
  //     {required this.id, required this.title, required this.imageUrl, Key? key})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (BuildContext context, product, Widget? child) {
              return IconButton(
                color: Colors.lightGreen,
                onPressed: () {
                  product.toggleFavoriteStatus();
                },
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
              );
            },
          ),
          trailing: IconButton(
            color: Colors.lightGreen,
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductsDetailScreen.id, arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
