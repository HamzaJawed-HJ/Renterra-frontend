import 'package:flutter/material.dart';
import 'package:fyp_renterra_frontend/core/utlis/helper_functions.dart';
import 'package:fyp_renterra_frontend/core/utlis/session_manager.dart';
import 'package:fyp_renterra_frontend/data/models/renter_model.dart';
import 'package:fyp_renterra_frontend/data/repositories/auth_repository.dart';
import 'package:fyp_renterra_frontend/routes/route_names.dart';

class RenterAuthViewModel extends ChangeNotifier {
  bool isLoading = false;

  String? _errorMessage;
  RenterModel? renterDetail;

  String? get errorMessage => _errorMessage;
  //RenterModel? get renterDetail => _renterDetail;

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  // Register Renter
  Future<void> registerRenter({
    required String fullName,
    required String phone,
    required String email,
    required String password,
    required String shopName,
    required String shopAddress,
    required String area,
    required String cnic,
    required BuildContext context,
  }) async {
    _setLoading(true);

    final response = await AuthRepository.registerRenter(
      fullName: fullName,
      phone: phone,
      email: email,
      password: password,
      shopName: shopName,
      shopAddress: shopAddress,
      area: area,
      cnic: cnic,
    );

    _setLoading(false);

    if (response['success']) {
      HelperFunctions.showSuccessSnackbar(
          context, 'Renter registered successfully');
      Navigator.pushReplacementNamed(context, RoutesName.renterLoginScreen);
    } else {
      HelperFunctions.showErrorSnackbar(context, response['message']);
    }
  }

  // Login User
  Future<void> loginRenter({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    _setLoading(true);

    try {
      // Call the API method from AuthRepository
      final response = await AuthRepository.loginRenter(
        email: email,
        password: password,
      );

      _setLoading(false);

      if (response['success']) {
//        HelperFunctions.showSuccessSnackbar(context, 'User LogIn successfully');

        // Create a User object from the response
        renterDetail = RenterModel.fromJson(response);
        //    print("CNIC: ${_user?.cnic.toString()}");
        notifyListeners();

        // Save user data and tokens to session
        await SessionManager.saveAccessToken(
            renterDetail!.accessToken.toString());
        await SessionManager.saveRefreshToken(
            renterDetail!.refreshToken.toString());
        await SessionManager.saveRenterInfo(renterDetail!);

        // Verify stored data (optional debugging)
        String? accessToken = await SessionManager.getAccessToken();
        String? refreshToken = await SessionManager.getRefreshToken();
        Map<String, String?> userInfo = await SessionManager.getUserInfo();

        print('Access Token: $accessToken');
        print('Refresh Token: $refreshToken');
        print('User Info: $userInfo');

        HelperFunctions.showSuccessSnackbar(context, 'LogIn successfully');

        // Navigate to dashboard
        Navigator.pushReplacementNamed(
            context, RoutesName.renterDashboardScreen);
      } else {
        _errorMessage = response['message'];

        _errorMessage = "Invalid request. Please check your inputs.";
        HelperFunctions.showErrorSnackbar(context, _errorMessage!);
        notifyListeners();
      }
    } catch (error) {
      // Assuming error is a string with a JSON structure like the one you mentioned
      HelperFunctions.showErrorSnackbar(
          context, error.toString()); // Show user-friendly error message
      _errorMessage = "Login failed. Please try again.";
      _setLoading(false);
      notifyListeners();
    }
  }
}
