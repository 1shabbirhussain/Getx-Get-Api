import 'dart:convert';

import 'package:asdfg/api_client/api-service.dart';
import 'package:asdfg/model/product_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductController extends GetxController {
  var productlist = <ProductModel>[].obs;
  var isLoading = true.obs;
  var favorites = <ProductModel>[].obs;

  @override
  void onInit() {
    loadFavoritesFromSharedPreferences();

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
      print("If worked");
    } else {
      favorites.add(product);
      print("else worked");
    }
    saveFavoritesToSharedPreferences();
    //print(favorites);
  }

  // Load favorites from shared preferences
  void loadFavoritesFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favList = prefs.getStringList('favorites');
    if (favList != null) {
      print('Retrieved JSON strings from shared preferences: \n $favList');
      favorites.value = favList
          .map((jsonString) => ProductModel.fromJsonString(jsonString))
          .toList();
    }
    fetchProducts();
    print(favorites);
  }

  // Save favorites to shared preferences
  void saveFavoritesToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favList =
        favorites.map((product) => jsonEncode(product.toJson())).toList();
    prefs.setStringList('favorites', favList);
    print("Saved to shared preferences");
    print(favList);
  }
}
