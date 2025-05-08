import 'package:flutter/material.dart';
import 'package:fyp_renterra_frontend/core/constants/app_colors.dart';
import 'package:fyp_renterra_frontend/viewModel/renter_viewModel/renter_profile_viewModel.dart';
import 'package:provider/provider.dart';

class RenterHomeScreen extends StatelessWidget {
  const RenterHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileViewModel>(
        builder: (context, profileViewModel, child) {
      // Load user data when the screen is initialized
      profileViewModel.loadUserData();
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            scrolledUnderElevation: 1,
            leadingWidth: double.infinity,
            toolbarHeight: 80,
            leading: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Icon(
                  Icons.person_rounded,
                  size: 40,
                  color: Color.fromARGB(255, 19, 111, 153),
                ),
              ),
              title: Text(
                "Good morning, ${profileViewModel.fullName ?? "Loading..."}",
                style: TextStyle(
                    fontSize: 20,
                    wordSpacing: 2,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              subtitle: Text(
                "${profileViewModel.role ?? "Loading..."}",
                style:
                    TextStyle(fontSize: 16, color: blueColor, letterSpacing: 3),
              ),
              trailing: CircleAvatar(
                  backgroundColor: Colors.white70,
                  child: Icon(
                    Icons.notifications_active_outlined,
                  )),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.toc_rounded,
                  size: 100,
                  color: Colors.grey,
                ),
                Text("Welcome to Home!!!!\nWe are working on it",
                    style: TextStyle(fontSize: 24)),
              ],
            ),
          ),
        ),
      );
    });
  }
}
