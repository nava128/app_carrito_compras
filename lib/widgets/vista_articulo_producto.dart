import 'package:flutter/material.dart';
import 'package:nava/proveedor/cls_articulos_del_carrito.dart';
import 'package:nava/proveedor/cls_producto.dart';
import 'package:nava/vistas/pagina_detalle_producto.dart';
import 'package:provider/provider.dart';

class ProductItemView extends StatelessWidget {
  // final String id;
  // final String title;
  // final String image;

  // const ProductItemView({
  //   Key? key,
  //   required this.id,
  //   required this.title,
  //   required this.image,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ProductDetailScreen.ProductDetailScreenRoute, arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(product.title),
          leading: Consumer<Product>(
            builder: (c, product, _) {
              return IconButton(
                  color: Theme.of(context).primaryColorLight,
                  onPressed: () {
                    product.toggleFavourite();
                  },
                  icon: product.isFavourite ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border));
            },
          ),
          trailing: IconButton(
              color: Theme.of(context).primaryColorLight,
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text(
                      'Item Added',
                    ),
                    action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {
                          cart.removeSingleItem(product.id);
                        }),
                  ),
                );
              },
              icon: const Icon(Icons.shopping_cart)),
        ),
      ),
    );
  }
}
