// carousel.dart
import 'dart:math';
import 'package:asdfg/screens/favourites_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'product_controller.dart';

class ProductView extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Products"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(FavoritesView());
                },
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Obx(() {
            return controller.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : ListView.separated(
                    itemCount: controller.productlist.length,
                    itemBuilder: (context, index) {
                      var product = controller.productlist[index];
                      return Obx(
                        () => ListTile(
                          title: Text(
                            product.title,
                            maxLines: 1, // Set the maximum number of lines
                            overflow: TextOverflow.ellipsis,
                          ),
                          leading: CircleAvatar(
                            child:
                                Image.network(product.image, fit: BoxFit.fill),
                            backgroundColor: Colors.transparent,
                            radius: 25,
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              controller.toggleFavorite(product);
                            },
                            icon: Icon(
                              controller.favorites.contains(product)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: controller.favorites.contains(product)
                                  ? Colors.red
                                  : null,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                  );
          }),
        ));
  }
}
