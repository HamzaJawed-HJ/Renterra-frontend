import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fyp_renterra_frontend/core/utlis/helper_functions.dart';
import 'package:fyp_renterra_frontend/core/utlis/session_manager.dart';
import 'package:fyp_renterra_frontend/data/models/product_model.dart';
import 'package:fyp_renterra_frontend/data/repositories/product_repository.dart';

class ProductViewModel with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  Future<void> createProduct({
    required String category,
    required String name,
    required String description,
    required String price,
    required String timePeriod,
    required File imageFile,
    required BuildContext context,
  }) async {
    _setLoading(true);

    final token =
        await SessionManager.getAccessToken(); // or any secure storage method

    Map<String, String?> userInfo = await SessionManager.getUserInfo();

    final location = userInfo['area'];

    final response = await ProductRepository.createProduct(
      token: token!,
      category: category,
      name: name,
      description: description,
      price: price,
      timePeriod: timePeriod,
      location: location!,
      imageFile: imageFile,
    );

    _setLoading(false);

    if (response['success']) {
      HelperFunctions.showSuccessSnackbar(context, response['message']);
    } else {
      HelperFunctions.showErrorSnackbar(context, response['message']);
    }
  }

  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

 String? error;


Future<void> getMyProducts() async {
    try {
      error = null;
      final data = await ProductRepository.fetchMyProducts();
      _products = data.map((e) => ProductModel.fromJson(e)).toList();
    } catch (e) {
      _products = [];
      error = e.toString();
    } finally {
      notifyListeners();
    }
  }

  ProductModel getById(String id) {
    return _products.firstWhere((prod) => prod.id == id);
  }
}
