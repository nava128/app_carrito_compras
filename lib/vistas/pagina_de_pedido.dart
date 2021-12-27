import 'package:flutter/material.dart';
import 'package:nava/proveedor/cls_articulo_pedido.dart';
import 'package:nava/widgets/app_drawer.dart';
import 'package:nava/widgets/vista_artuculo_pedido.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  //const OrderScreen({Key? key}) : super(key: key);
  const OrderScreen({Key key}) : super(key: key);

  static const OrderScreenRouteName = '/orderscreen';

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context).orders;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      drawer: const AppDrawer(),
      body: orders.length > 0
          ? ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return OrderItemView(orderItem: orders[index]);
              })
          : const Center(
              child: Text('No Orders'),
            ),
    );
  }
}
