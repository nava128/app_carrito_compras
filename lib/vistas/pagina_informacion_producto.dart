import 'package:flutter/material.dart';
import 'package:nava/proveedor/cls_articulos_del_carrito.dart';
import 'package:nava/proveedor/cls_producto.dart';
import 'package:nava/vistas/pagina_carrito.dart';
import 'package:nava/widgets/app_drawer.dart';
import 'package:nava/widgets/Insignia.dart';
import 'package:nava/widgets/vista_articulo_producto.dart';
import 'package:nava/widgets/productos_gridview.dart';
import 'package:provider/provider.dart';

enum FliterOptions {
  ShowAll,
  ShowFavourite,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shopping App'),
        actions: [
          Consumer<Cart>(
            builder: (_, cart, ch) {
              return Badge(
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(CartScreen.CartScreenRoute);
                      },
                      icon: const Icon(Icons.shopping_cart)),
                  value: cart.itemCount.toString());
            },
          ),
          PopupMenuButton(
              onSelected: (FliterOptions selected) {
                setState(() {
                  if (selected == FliterOptions.ShowFavourite) {
                    _showFavourite = true;
                  } else {
                    _showFavourite = false;
                  }
                });
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) {
                return [
                  const PopupMenuItem(value: FliterOptions.ShowAll, child: Text('Show All')),
                  const PopupMenuItem(value: FliterOptions.ShowFavourite, child: Text('Show favourite'))
                ];
              })
        ],
      ),
      drawer: AppDrawer(),
      body: ProductGridView(
        showFavourite: _showFavourite,
      ),
    );
  }
}
