import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:batterylevel/data/provider/cart.dart';
import 'package:batterylevel/ui/routing/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


@RoutePage()
class HomePage extends StatelessWidget {
  static String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App Testing'),
        actions: <Widget>[
          TextButton.icon(
            style: TextButton.styleFrom(primary: Colors.white),
            onPressed: () {
              context.replaceRoute(CartPage());
            },
            icon: Icon(Icons.shopping_cart,color: Colors.black,),
            label: Text('Cart'),
            key: Key('cart'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 100,
        cacheExtent: 20.0,
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) => ItemTile(index),
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final int itemNo;

  const ItemTile(
      this.itemNo,
      );

  @override
  Widget build(BuildContext context) {
    var cartList = Provider.of<Cart>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 30,
          child: Placeholder(),
        ),
        title: Text(
          'Product $itemNo',
          key: Key('text_$itemNo'),
        ),
        trailing: IconButton(
          key: Key('icon_$itemNo'),
          icon: cartList.items.contains(itemNo)
              ? Icon(Icons.shopping_cart)
              : Icon(Icons.shopping_cart_outlined),
          onPressed: () {
            !cartList.items.contains(itemNo)
                ? cartList.add(itemNo)
                : cartList.remove(itemNo);
            // Scaffold.of(context).showSnackBar(
            //   SnackBar(
            //     content: Text(cartList.items.contains(itemNo)
            //         ? 'Added to cart.'
            //         : 'Removed from cart.'),
            //     duration: Duration(seconds: 1),
            //   ),
            // );
          },
        ),
      ),
    );
  }
}