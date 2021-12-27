import 'package:flutter/material.dart';
import 'package:nava/proveedor/cls_articulos_del_carrito.dart';
import 'package:nava/proveedor/cls_articulo_pedido.dart';
import 'package:nava/vistas/pagina_de_pedido.dart';
import 'package:nava/widgets/vista_articulo_carrito.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  // const CartScreen({Key? key}) : super(key: key);
  const CartScreen({Key key}) : super(key: key);

  static const CartScreenRoute = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            elevation: 5,
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Total'),
                ),
                const Spacer(),
                Chip(
                    backgroundColor: Theme.of(context).primaryColorLight,
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.white),
                    )),
                TextButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(cart.items.values.toList(), cart.totalAmount);

                      cart.clearCart();
                    },
                    child: Text('order now'.toUpperCase()))
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          cart.items.length > 0
              ? Expanded(
                  child: ListView.builder(
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) {
                        return CartItemView(
                          price: cart.items.values.toList()[index].price,
                          title: cart.items.values.toList()[index].title,
                          id: cart.items.values.toList()[index].id,
                          productId: cart.items.keys.toList()[index],
                          quantity: cart.items.values.toList()[index].quantity,
                        );
                      }))
              : const Text('No se agregaronArticulos')
        ],
      ),
    );
  }
}
