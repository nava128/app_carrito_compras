import 'package:flutter/material.dart';
import 'package:nava/proveedor/cls_articulos_del_carrito.dart';
import 'package:nava/proveedor/cls_articulo_pedido.dart';
import 'package:nava/proveedor/cls_datos_producto_proveedor.dart';
import 'package:nava/vistas/pagina_carrito.dart';
import 'package:nava/vistas/pag_editar_agregar_productos.dart';
import 'package:nava/vistas/pagina_de_pedido.dart';
import 'package:nava/vistas/pagina_detalle_producto.dart';
import 'package:nava/vistas/pagina_informacion_producto.dart';
import 'package:nava/vistas/pagina_productos_del_usuario.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.blue.shade700, primaryColorDark: Colors.blue.shade900, primaryColorLight: Colors.blueAccent.shade200),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.ProductDetailScreenRoute: (context) => const ProductDetailScreen(),
          CartScreen.CartScreenRoute: (context) => const CartScreen(),
          OrderScreen.OrderScreenRouteName: (context) => const OrderScreen(),
          UserProductsScreen.UserPrdtScreenRouteName: (context) => const UserProductsScreen(),
          EditOrAddProductScreen.EditAddScreenRouteName: (context) => const EditOrAddProductScreen(),
        },
      ),
    );
  }
}
