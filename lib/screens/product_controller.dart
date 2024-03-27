import 'package:asdfg/screens/api-service.dart';
import 'package:asdfg/screens/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var productlist = <ProductModel>[].obs;
  var isLoading = true.obs;
  var favorites = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }
//FETCH PRODUCT FROM API CALL
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
//THIS WILL CHNAGE ICON FOR FAVOURITE AND ADD AND REMOVE ITEM FROM FAV LIST
  void toggleFavorite(ProductModel product) {
    if (favorites.contains(product)) {
      favorites.remove(product);
      //print("If worked");
    } else {
      favorites.add(product);
      //print("else worked");
    }
    //print(favorites);
  }
}
