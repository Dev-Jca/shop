import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/screens/splash_screen.dart';
import './providers/auth_provider.dart';
import './screens/auth_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/orders_screen.dart';
import './screens/user_products_screen.dart';
import './providers/cart_provider.dart';
import './providers/products_provider.dart';
import './screens/cart_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';
import './providers/orders_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          update: (context, auth, previousProducts) => Products(
            auth.token,
            auth.userId,
            previousProducts == null ? [] : previousProducts.items,
          ),
          create: (_) => Products('', '', []),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          update: (context, auth, previousOrders) => Orders(
            auth.token!,
            auth.userId!,
            previousOrders == null ? [] : previousOrders.orders,
          ),
          create: (context) => Orders('', '', []),
        ),
      ],
      child: Consumer<Auth>(
        builder: (context, auth, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            // appBarTheme: const AppBarTheme(foregroundColor: Colors.black87),
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Colors.indigo,
              secondary: Colors.teal,
            ),
            fontFamily: 'Lato',
          ),
          home: auth.isAuth
              ? ProductsOverviewScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (context, snapshot) {
                    return snapshot.connectionState == ConnectionState.waiting
                        ? const SplashScreen()
                        : AuthScreen();

                    // if (snapshot.connectionState == ConnectionState.waiting) {
                    //   return const SplashScreen();
                    // }

                    // if (snapshot.hasError) {
                    //   return AuthScreen();
                    // }

                    // if (snapshot.hasData && snapshot.data != null) {
                    //   return ProductsOverviewScreen();
                    // } else {
                    //   return AuthScreen();
                    // }
                  }),
          routes: {
            ProductsDetailScreen.routeName: (context) =>
                const ProductsDetailScreen(),
            CartScreen.routeName: (context) => const CartScreen(),
            OrdersScreen.routeName: (context) => const OrdersScreen(),
            ProductsOverviewScreen.routeName: (context) =>
                ProductsOverviewScreen(),
            UserProductsScreen.routeName: (context) =>
                const UserProductsScreen(),
            EditProductScreen.routeName: (context) => const EditProductScreen(),
            AuthScreen.routeName: (context) => AuthScreen(),
          },
        ),
      ),
    ),
  );
}
