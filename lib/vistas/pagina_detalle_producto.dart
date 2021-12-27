import 'package:flutter/material.dart';
import 'package:nava/proveedor/cls_datos_producto_proveedor.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  //const ProductDetailScreen({Key? key}) : super(key: key);
  const ProductDetailScreen({Key key}) : super(key: key);

  static const ProductDetailScreenRoute = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<ProductProvider>(context, listen: false).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.grey,
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${loadedProduct.description}',
                      maxLines: 3,
                      style: const TextStyle(fontSize: 40),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\$${loadedProduct.price}',
                    style: const TextStyle(fontSize: 40),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
