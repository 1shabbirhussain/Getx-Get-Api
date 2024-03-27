import 'package:asdfg/screens/api-service.dart';
import 'package:asdfg/screens/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productlist = <ProductModel>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var response = await ApiService().fetchProduct();
      if (response != null) {
        productlist.assignAll(response as List<ProductModel>);
      }
    } finally {
      isLoading(false);
    }
  }
}
