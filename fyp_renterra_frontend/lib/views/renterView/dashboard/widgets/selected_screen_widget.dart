  // Returns the selected screen based on the current tab index
  import 'package:flutter/material.dart';
import 'package:fyp_renterra_frontend/views/renterView/dashboard/renter_home_screen.dart';
import 'package:fyp_renterra_frontend/views/renterView/dashboard/renter_profile_screen.dart';

Widget getSelectedScreen(int index) {
    switch (index) {
      case 0:
        return const RenterHomeScreen(); // Home tab content
      case 1:
        return RenterProfileScreen(); // Profile tab content
      // case 2:
      //   return SettingsScreen(); // Settings tab content
      default:
        return RenterHomeScreen(); // Default to Home tab
    }
  }