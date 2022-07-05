import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/products_provider.dart';
import '../widgets/app_drawer.dart';
import '../widgets/badge.dart';
import '../widgets/product_grid.dart';
import '../models/cart_provider.dart';
import 'cart_screen.dart';

enum FilterOptions { favorites, all }

class ProductsOverviewScreen extends StatefulWidget {
  static const routeName = 'products_overview';
  ProductsOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = false;

  // @override
  // void initState() {
  //   Future.delayed(Duration.zero).then((value) {
  //     Provider.of<Products>(context).fetchAndSetProducts();
  //   });
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<Products>(context).fetchAndSetProducts().then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MyShop',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
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
          ),
          Consumer<Cart>(
            builder: (context, cart, child) {
              return Badge(
                value: cart.itemCount.toString(),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                  ),
                ),
              );
            },
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ProductsGrid(
              showOnlyFavorite: _showOnlyFavorites,
            ),
    );
  }
}
