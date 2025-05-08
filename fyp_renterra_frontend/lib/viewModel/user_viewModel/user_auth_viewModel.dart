import 'package:flutter/material.dart';
import 'package:fyp_renterra_frontend/core/utlis/helper_functions.dart';
import 'package:fyp_renterra_frontend/core/utlis/session_manager.dart';
import 'package:fyp_renterra_frontend/data/models/user_model.dart';
import 'package:fyp_renterra_frontend/data/repositories/auth_repository.dart';
import 'package:fyp_renterra_frontend/routes/route_names.dart';

class UserAuthViewModel extends ChangeNotifier {
  bool isLoading = false;

  String? _errorMessage;
  User? _user;

  String? get errorMessage => _errorMessage;
  User? get user => _user;

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  // Register User
  Future<void> registerUser({
    required String fullName,
    required String phone,
    required String email,
    required String password,
    required String area,
    required String cnic,
    required BuildContext context,
  }) async {
    _setLoading(true);

    final response = await AuthRepository.registerUser(
      fullName: fullName,
      phone: phone,
      email: email,
      password: password,
      area: area,
      cnic: cnic,
    );

    _setLoading(false);

    if (response['success']) {
      HelperFunctions.showSuccessSnackbar(
          context, 'User registered successfully');
      Navigator.pushReplacementNamed(context, RoutesName.userLoginScreen);
    } else {
      HelperFunctions.showErrorSnackbar(context, response['message']);
    }
  }

  // Login User
  Future<void> loginUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    _setLoading(true);

    try {
      // Call the API method from AuthRepository
      final response = await AuthRepository.loginUser(
        email: email,
        password: password,
      );

      _setLoading(false);

      if (response['success']) {
//        HelperFunctions.showSuccessSnackbar(context, 'User LogIn successfully');

        // Create a User object from the response
        _user = User.fromJson(response);
        //    print("CNIC: ${_user?.cnic.toString()}");
        notifyListeners();

        // Save user data and tokens to session
        await SessionManager.saveAccessToken(_user!.accessToken.toString());
        await SessionManager.saveRefreshToken(_user!.refreshToken.toString());
        await SessionManager.saveUserInfo(_user!);

        // Verify stored data (optional debugging)
        String? accessToken = await SessionManager.getAccessToken();
        String? refreshToken = await SessionManager.getRefreshToken();
        Map<String, String?> userInfo = await SessionManager.getUserInfo();

        print('Access Token: $accessToken');
        print('Refresh Token: $refreshToken');
        print('User Info: $userInfo');

        HelperFunctions.showSuccessSnackbar(context, 'User login successfully');

        // Navigate to dashboard
        Navigator.pushReplacementNamed(context, RoutesName.UserDashboardScreen);
      } else {
        _errorMessage = response['message'] ?? "An unexpected error occurred";

        // Handle status codes with user-friendly messages
        int statusCode = response['statusCode'] ??
            400; // Default to 500 if no statusCode is found

        switch (statusCode) {
          case 400:
            _errorMessage = "Invalid request. Please check your inputs.";
            break;
          case 401:
            _errorMessage = "You are not authorized to perform this action.";
            break;
          case 403:
            _errorMessage =
                "You do not have permission to access this resource.";
            break;
          case 404:
            _errorMessage =
                response['message'] ?? "The requested resource was not found.";
            break;
          case 500:
            _errorMessage =
                "Something went wrong on the server. Please try again later.";
            break;
          default:
            // Default message for unexpected errors
            _errorMessage =
                response['message'] ?? "An unexpected error occurred.";
            break;
        }

        // Show the error message to the user using your helper function
        HelperFunctions.showErrorSnackbar(context, _errorMessage!);
        notifyListeners();
      }
    } catch (error) {
      // Assuming error is a string with a JSON structure like the one you mentioned
      // HelperFunctions.showErrorSnackbar(
      //     context, error.toString()); // Show user-friendly error message
      _errorMessage = "Login failed. Please try again.";
      _setLoading(false);
      notifyListeners();
    }
  }
}
