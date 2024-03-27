import 'package:asdfg/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesView extends StatelessWidget {
  final ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Obx(() {
          return ListView.builder(
            itemCount: controller.favorites.length,
            itemBuilder: (context, index) {
              var product = controller.favorites[index];
              return Column(
                children: [
                  ListTile(
                    title: Text(product.title),
                    leading: CircleAvatar(
                      child: Image.network(product.image, fit: BoxFit.fill),
                      backgroundColor: Colors.transparent,
                      radius: 25,
                    ),
                  ),
                  const Divider()
                ],
              );
            },
          );
        }),
      ),
    );
  }
}
