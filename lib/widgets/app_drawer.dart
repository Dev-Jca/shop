import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/user_products_screen.dart';
import '../providers/auth_provider.dart';
import '../screens/orders_screen.dart';
import '../screens/products_overview_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Shop'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(ProductsOverviewScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Orders'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Manage Products'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductsScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
              // Navigator.of(context)
              //     .pushReplacementNamed(UserProductsScreen.routeName);
              Provider.of<Auth>(context, listen: false).logOut();
            },
          ),
        ],
      ),
    );
  }
}
