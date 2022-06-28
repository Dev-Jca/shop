import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart_provider.dart';
import 'package:shop/models/products_provider.dart';
import 'package:shop/screens/cart_screen.dart';
import 'package:shop/screens/product_detail_screen.dart';
import 'package:shop/screens/products_overview_screen.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(foregroundColor: Colors.black87),
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
        },
      ),
    ),
  );
}
