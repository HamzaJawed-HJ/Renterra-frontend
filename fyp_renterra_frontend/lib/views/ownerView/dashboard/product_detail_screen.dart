import 'package:flutter/material.dart';
import 'package:fyp_renterra_frontend/viewModel/renter_viewModel/ProductViewModel.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productId;

  const ProductDetailsScreen({required this.productId});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductViewModel>(context).getById(productId);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade500,
        title: Text(
          "Product Details",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              product.image,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 250,
                color: Colors.grey[300],
                child: Icon(Icons.broken_image, size: 60),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("Rs ${product.price} / ${product.timePeriod}",
                      style:
                          TextStyle(fontSize: 18, color: Colors.blue.shade700)),
                  SizedBox(height: 16),
                  _infoRow(Icons.category, "Category", product.category),
                  _infoRow(Icons.location_on, "Location", product.location),
                  _infoRow(Icons.timer, "Rental Period", product.timePeriod),
                  SizedBox(height: 16),
                  Text("Description",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 4),
                  Text(product.description),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Edit Product",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                      ),
                      ElevatedButton.icon(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Delete Product",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade600),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.blue),
          SizedBox(width: 8),
          Text("$label: ", style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
