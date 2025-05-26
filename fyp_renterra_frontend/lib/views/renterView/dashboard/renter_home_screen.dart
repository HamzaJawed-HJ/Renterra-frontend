import 'package:flutter/material.dart';
import 'package:fyp_renterra_frontend/core/constants/app_colors.dart';
import 'package:fyp_renterra_frontend/viewModel/renter_viewModel/renter_profile_viewModel.dart';
import 'package:fyp_renterra_frontend/views/renterView/dashboard/widgets/car_card_widget.dart';
import 'package:fyp_renterra_frontend/views/renterView/dashboard/widgets/category_selector_widget.dart';
import 'package:provider/provider.dart';

class RenterHomeScreen extends StatelessWidget {
  const RenterHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> carData = [
      {
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2ibedqF9udzsjEi-8Mg-DVZ0bFFGWobM4rA&s',
        'title': 'Toyota Corolla',
        'variant': 'GLi',
        'city': 'Karachi',
        'price': 'Rs. 5500/day',
        'isFeatured': false,
        'isInsured': false,
      },
      {
        'imageUrl':
            'https://images.pexels.com/photos/358070/pexels-photo-358070.jpeg?auto=compress&cs=tinysrgb&w=800',
        'title': 'Toyota Fortuner',
        'variant': 'VVTi',
        'city': 'Lahore',
        'price': 'Rs. 22000/day',
        'isFeatured': false,
        'isInsured': false,
      },
      {
        'imageUrl':
            'https://images.pexels.com/photos/1149831/pexels-photo-1149831.jpeg?auto=compress&cs=tinysrgb&w=800',
        'title': 'Toyota Hilux',
        'variant': 'Revo V',
        'city': 'Islamabad',
        'price': 'Rs. 11000/day',
        'isFeatured': false,
        'isInsured': false,
      },
      {
        'imageUrl':
            'https://images.pexels.com/photos/112460/pexels-photo-112460.jpeg?auto=compress&cs=tinysrgb&w=800',
        'title': 'Changan Karvaan',
        'variant': 'Base Model 1.0',
        'city': 'Rawalpindi',
        'price': 'Rs. 6000/day',
        'isFeatured': false,
        'isInsured': false,
      },
      {
        'imageUrl':
            'https://images.pexels.com/photos/120049/pexels-photo-120049.jpeg?auto=compress&cs=tinysrgb&w=800',
        'title': 'Honda Civic',
        'variant': 'Turbo Oriel',
        'city': 'Peshawar',
        'price': 'Rs. 7500/day',
        'isFeatured': false,
        'isInsured': false,
      },
    ];

    final List<Map<String, dynamic>> featuredcarData = [
      {
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOWCXtve-MwVDizbw1VSde0z0psVam-3ua1g&s',
        'title': 'Toyota Fortuner',
        'variant': 'VVTi',
        'city': 'Karachi',
        'price': 'Rs. 22000/day',
        'isFeatured': true,
        'isInsured': false,
      },
      {
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9fhsAHA5n9rILElMNmtTPmwLdmnP5uvQORw&s',
        'title': 'Toyota Corolla',
        'variant': 'GLi',
        'city': 'Karachi',
        'price': 'Rs. 5500/day',
        'isFeatured': true,
        'isInsured': false,
      },
      {
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOWCXtve-MwVDizbw1VSde0z0psVam-3ua1g&s',
        'title': 'Toyota Coaster',
        'variant': 'Saloon',
        'city': 'Lahore',
        'price': 'Rs. 18000/day',
        'isFeatured': true,
        'isInsured': false,
      },
    ];

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
              leading: const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?t=st=1690584010~exp=1690584610~hmac=61a99790ea214f0780ef9ccc54df669120077f07599d19f61d4497af69d56cab"),

                // Icon(
                //   Icons.person_rounded,
                //   size: 40,
                //   color: Color.fromARGB(255, 19, 111, 153),
                // ),
              ),
              title: Text(
                "Good Morning, ${profileViewModel.fullName ?? "Loading"}",
                style: TextStyle(
                    fontSize: 20,
                    wordSpacing: 2,
                    fontWeight: FontWeight.bold,
                    color: blueColor),
              ),
              // subtitle: Text(
              //   "${profileViewModel.role ?? "Loading..."}",
              //   style:
              //       TextStyle(fontSize: 16, color: blueColor, letterSpacing: 3),
              // ),
              trailing: CircleAvatar(
                  backgroundColor: Colors.white70,
                  child: Icon(
                    Icons.notifications_active_outlined,
                  )),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
                right: 20.0, left: 20, top: 2, bottom: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    child: const SearchBar(
                        leading: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Icon(Icons.search),
                        ),
                        hintText: "Search....",
                        // ignore: deprecated_member_use
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 243, 243, 243)),
                        trailing: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.tune),
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Featured Cars",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: featuredcarData.map((car) {
                          return CarCard(
                            imageUrl: car['imageUrl'],
                            title: car['title'],
                            variant: car['variant'],
                            city: car['city'],
                            price: car['price'],
                            isFeatured: car['isFeatured'],
                            isInsured: car['isInsured'],
                          );
                        }).toList(),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Rental Categories",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  CategorySelector(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "All Rental Cars",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    height: 800,
                    child: ListView.builder(
                        itemCount: carData.length,
                        itemBuilder: (context, index) {
                          final car = carData[index];
                          return CarCard(
                              imageHeight: 140,
                              width: double.infinity,
                              imageUrl: car['imageUrl'],
                              title: car['title'],
                              variant: car['variant'],
                              city: car['city'],
                              price: car['price']);
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
