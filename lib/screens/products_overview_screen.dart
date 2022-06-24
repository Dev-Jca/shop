import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product_provider.dart';
import 'package:shop/widgets/product_grid.dart';
import '../models/products_provider.dart';
import '../widgets/product_item.dart';

enum FilterOptions { favorites, all }

class ProductsOverviewScreen extends StatefulWidget {
  ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          PopupMenuButton<FilterOptions>(
            icon: const Icon(Icons.more_vert),
            onSelected: (selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.favorites) {
                  _showOnlyFavorites = true;
                } else if (selectedValue == FilterOptions.all) {
                  _showOnlyFavorites = false;
                }
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: FilterOptions.favorites,
                child: Text('Only Favorites'),
              ),
              const PopupMenuItem(
                value: FilterOptions.all,
                child: Text('Show All'),
              ),
            ],
          )
        ],
      ),
      body: ProductsGrid(
        showFavorite: _showOnlyFavorites,
      ),
    );
  }
}
