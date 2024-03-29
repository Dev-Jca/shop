import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/widgets/single_cart_item.dart';

import '../providers/cart_provider.dart';
import '../providers/orders_provider.dart';
import '../widgets/order_button.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart_screen';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    String totalAmount =
        double.parse(cart.totalAmount.toString()).toStringAsFixed(2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text('\$$totalAmount'),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  OrderButton(
                    cart: cart,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) => SingleCartItem(
                  id: cart.items.values.toList()[index].id,
                  productId: cart.items.keys.toList()[index],
                  title: cart.items.values.toList()[index].title,
                  price: cart.items.values.toList()[index].price,
                  quantity: cart.items.values.toList()[index].quantity),
            ),
          ),
        ],
      ),
    );
  }
}
