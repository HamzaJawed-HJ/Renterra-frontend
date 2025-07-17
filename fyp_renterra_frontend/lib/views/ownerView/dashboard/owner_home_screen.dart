import 'package:flutter/material.dart';
import 'package:fyp_renterra_frontend/viewModel/renter_viewModel/ProductViewModel.dart';
import 'package:fyp_renterra_frontend/views/ownerView/dashboard/product_detail_screen.dart';
import 'package:fyp_renterra_frontend/views/ownerView/dashboard/widgets/product_card.dart';
import 'package:provider/provider.dart';

class OwnerHomeScreen extends StatefulWidget {
  const OwnerHomeScreen({super.key});

  @override
  State<OwnerHomeScreen> createState() => _OwnerHomeScreenState();
}

class _OwnerHomeScreenState extends State<OwnerHomeScreen> {
  @override
  void initState() {
    Provider.of<ProductViewModel>(context, listen: false).getMyProducts();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final productProvider =
    //     Provider.of<ProductViewModel>(context, listen: false);
    // final products = productProvider.products;

    return Scaffold(
        appBar: AppBar(
          leading: SizedBox.shrink(),
          centerTitle: true,
          backgroundColor: Colors.blue.shade700,
          title: Text(
            "Welcome back!",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.account_circle)),
          ],
        ),
        body: Consumer<ProductViewModel>(
          builder: (context, value, child) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStatsRow(
                    totalItem: value.products.length,
                    rentedItem: value.products.length - 1),
                SizedBox(height: 16),
                Text("My Listing",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),

                Expanded(
                  child: Consumer<ProductViewModel>(
                    builder: (context, provider, _) {
                      if (provider.error != null) {
                        return Center(child: Text('Error: ${provider.error}'));
                      }

                      if (provider.products.isEmpty) {
                        return Center(child: Text('No products found'));
                      }

                      return RefreshIndicator(
                        onRefresh: provider.getMyProducts,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: provider.products.length,
                          itemBuilder: (context, index) {
                            final product = provider.products[index];
                            return ProductCard(
                              product: product,
                              onView: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ProductDetailsScreen(
                                        productId: product.id),
                                  ),
                                );
                              },
                              onEdit: () {
                                // Navigate to edit screen (you will add logic later)
                              },
                            );

                            //  ListTile(
                            //   title: Text(product.name),
                            //   subtitle: Text(product.category),
                            //   leading: Image.network(
                            //     '${ApiClient.baseImageUrl}${product.image}',
                            //     width: 50,
                            //     errorBuilder: (_, __, ___) =>
                            //         Icon(Icons.image_not_supported),
                            //   ),
                            // );
                          },
                        ),
                      );
                    },
                  ),
                )
                // ...products.map((product) =>
              ],
            ),
          ),
        ));
  }
}

Widget _buildStatsRow({int? totalItem, rentedItem}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      _statCard("Available", "1", Icons.check_circle),
      _statCard("Total Items", totalItem.toString(), Icons.inventory),
      _statCard("Rented", rentedItem.toString(), Icons.local_shipping),
    ],
  );
}

Widget _statCard(String label, String count, IconData icon) {
  return Expanded(
    child: Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            Icon(icon, color: Colors.blue),
            SizedBox(height: 4),
            Text(count, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(label, style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    ),
  );
}
