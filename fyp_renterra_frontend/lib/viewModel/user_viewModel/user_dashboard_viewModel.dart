import 'package:flutter/material.dart';
import 'package:fyp_renterra_frontend/views/renterView/dashboard/booking_view/my_booking_screen.dart';
import 'package:fyp_renterra_frontend/views/ownerView/dashboard/add_product_screen.dart';
import 'package:fyp_renterra_frontend/views/ownerView/dashboard/rental_requests_screen.dart';
import 'package:fyp_renterra_frontend/views/ownerView/dashboard/user_chat_screen.dart';
import 'package:fyp_renterra_frontend/views/ownerView/dashboard/owner_home_screen.dart';
import 'package:fyp_renterra_frontend/views/ownerView/dashboard/user_profile_screen.dart';

class UserDashboardViewModel with ChangeNotifier {
  int _selectedIndex = 0; // To track the selected bottom nav item

  // Get the selected index
  int get selectedIndex => _selectedIndex;

  // Set the selected index and notify listeners
  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Widget getSelectedScreen(int index) {
    switch (index) {
      case 0:
        return const OwnerHomeScreen(); // Home tab content
      case 1:
        return AddProductScreen();
      //  UserChatScreen();

      // Profile tab content
      case 2:
        return RentalRequestsScreen();

      case 3:
        return const UserProfileScreen();
      default:
        return OwnerHomeScreen(); // Default to Home tab
    }
  }
}
