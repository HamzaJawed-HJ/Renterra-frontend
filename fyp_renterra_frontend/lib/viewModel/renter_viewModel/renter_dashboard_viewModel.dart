import 'package:flutter/material.dart';
import 'package:fyp_renterra_frontend/views/renterView/dashboard/booking_view/my_booking_screen.dart';
import 'package:fyp_renterra_frontend/views/renterView/dashboard/renter_home_screen.dart';
import 'package:fyp_renterra_frontend/views/userView/dashboard/user_chat_screen.dart';
import 'package:fyp_renterra_frontend/views/userView/dashboard/user_profile_screen.dart';

class RenterDashboardViewModel with ChangeNotifier {
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
        return const RenterHomeScreen(); // Home tab content
      case 1:
        return ScheduleScreen(); // Profile tab content
      case 2:
        return const UserChatScreen();

      case 3:
        return const UserProfileScreen();
      default:
        return RenterHomeScreen(); // Default to Home tab
    }
  }
}
