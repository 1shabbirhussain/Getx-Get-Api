// carousel.dart
import 'dart:math';
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
                      return ListTile(
                        title: Text(
                          product.title,
                          maxLines: 1, // Set the maximum number of lines
                          overflow: TextOverflow.ellipsis,
                        ),
                        leading: CircleAvatar(
                          child: Image.network(product.image, fit: BoxFit.fill),
                          backgroundColor: Colors.transparent,
                          radius: 25,
                        ),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border)),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                  );
          }),
        ));
  }

  // Widget carouselView(HomeController controller, int index) {
  //   return AnimatedBuilder(
  //     animation: controller.pageController,
  //     builder: (context, child) {
  //       double value = 0.0;
  //       if (controller.pageController.position.haveDimensions) {
  //         value = index.toDouble() - (controller.pageController.page ?? 0);
  //         value = (value * 0.038).clamp(-1, 1);
  //         // print("value $value index $index");
  //       }
  //       return Transform.rotate(
  //         angle: pi * value,
  //         child: carouselCard(controller.model.images[index]),
  //       );
  //     },
  //   );
  // }

  // Widget carouselCard(String image) {
  //   return Column(
  //     children: <Widget>[
  //       Expanded(
  //         child: Padding(
  //           padding: const EdgeInsets.all(20.0),
  //           child: Hero(
  //             tag: image,
  //             child: GestureDetector(
  //               onTap: () {
  //                 Get.to(() => DetailsScreen(image: image));
  //                 controller.innertimer.cancel();
  //               },
  //               child: Container(
  //                 decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   borderRadius: BorderRadius.circular(30),
  //                   image: DecorationImage(
  //                     image: NetworkImage(image),
  //                     fit: BoxFit.fill,
  //                   ),
  //                   boxShadow: const [
  //                     BoxShadow(
  //                       offset: Offset(0, 4),
  //                       blurRadius: 4,
  //                       color: Colors.black26,
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //       const Padding(
  //         padding:  EdgeInsets.only(top: 20),
  //         child:  Text(
  //           "Title",
  //           style: TextStyle(
  //             color: Colors.black45,
  //             fontSize: 25,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //       const Padding(
  //         padding: EdgeInsets.all(8.0),
  //         child: Text(
  //           "Sub-Title",
  //           style: TextStyle(
  //             color: Colors.black87,
  //             fontSize: 16,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }
}
