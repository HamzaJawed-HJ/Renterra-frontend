import 'package:flutter/material.dart';
import 'package:fyp_renterra_frontend/generic_widgets/bottom_navbar.dart';
import 'package:fyp_renterra_frontend/viewModel/renter_viewModel/renter_dashboard_viewModel.dart';
import 'package:fyp_renterra_frontend/views/renterView/dashboard/renter_home_screen.dart';
import 'package:fyp_renterra_frontend/views/renterView/dashboard/widgets/selected_screen_widget.dart';
import 'package:provider/provider.dart';

class RenterDashboardScreen extends StatelessWidget {
  const RenterDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DashboardViewModel(),
      child: Consumer<DashboardViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
              body: getSelectedScreen(viewModel.selectedIndex),
              bottomNavigationBar: BottomNavBar(
                index: viewModel.selectedIndex,
                onTap: (index) {
                  viewModel.setSelectedIndex(index); // Change selected tab
                },
              )

              //  BottomNavigationBar(
              //   currentIndex: viewModel.selectedIndex,
              //   onTap: (index) {
              //     viewModel.setSelectedIndex(index); // Change selected tab
              //   },
              //   items: const [
              //     BottomNavigationBarItem(
              //       icon: Icon(Icons.home),
              //       label: 'Home',
              //     ),
              //     BottomNavigationBarItem(
              //       icon: Icon(Icons.person),
              //       label: 'Profile',
              //     ),
              //   ],
              // ),
              );
        },
      ),
    );
  }
}
