import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';
import './models/cart_provider.dart';
import './models/products_provider.dart';
import './screens/cart_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';
import './models/orders_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(foregroundColor: Colors.black87),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.yellow,
            secondary: Colors.lightGreen,
          ),
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductsDetailScreen.routeName: (context) =>
              const ProductsDetailScreen(),
          CartScreen.routeName: (context) => const CartScreen(),
          OrdersScreen.routeName: (context) => const OrdersScreen(),
          ProductsOverviewScreen.routeName: (context) =>
              ProductsOverviewScreen(),
          UserProductsScreen.routeName: (context) => const UserProductsScreen(),
        },
      ),
    ),
  );
}
