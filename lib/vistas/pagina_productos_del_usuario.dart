import 'package:flutter/material.dart';
import 'package:nava/proveedor/cls_producto.dart';
import 'package:nava/proveedor/cls_datos_producto_proveedor.dart';
import 'package:nava/vistas/pag_editar_agregar_productos.dart';
import 'package:nava/widgets/app_drawer.dart';
import 'package:nava/widgets/vistas_productos.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  // const UserProductsScreen({Key? key}) : super(key: key);
  const UserProductsScreen({Key key}) : super(key: key);

  static const UserPrdtScreenRouteName = '/user-products';

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditOrAddProductScreen.EditAddScreenRouteName, arguments: EditAddArguments(isEdit: false, productId: ''));
              },
              child: const Text(
                'Add New',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      drawer: const AppDrawer(),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          itemBuilder: (context, index) {
            return ProductsView(
              id: products.items[index].id,
              price: products.items[index].price,
              desc: products.items[index].description,
              title: products.items[index].title,
              image: products.items[index].imageUrl,
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: products.items.length),
    );
  }
}
