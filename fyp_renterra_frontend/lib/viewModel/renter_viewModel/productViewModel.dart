import 'package:flutter/material.dart';
import 'package:fyp_renterra_frontend/data/models/product_model.dart';

class ProductViewModel with ChangeNotifier {
  List<Product> _products = [
    Product(
      id: 'c1',
      category: 'Cars',
      name: 'Tesla Model S Plaid',
      description:
          'Luxury electric sedan with tri-motor AWD, 1,020 hp, 0–60 mph in 1.99s, and over 390 miles range.',
      price: "89990",
      timePeriod: '2025 Model',
      location: 'USA',
      image: 'https://via.placeholder.com/150?text=Tesla+Model+S+Plaid',
    ),
    Product(
      id: 'c2',
      category: 'Cars',
      name: 'Toyota Corolla 2025',
      description:
          'Reliable compact sedan with hybrid option, advanced safety features, and modern infotainment.',
      price: "24500",
      timePeriod: '2025 Model',
      location: 'Global',
      image: 'https://via.placeholder.com/150?text=Toyota+Corolla+2025',
    ),
    Product(
      id: 'c3',
      category: 'Cars',
      name: 'Hyundai Ioniq 6',
      description:
          'Electric sedan with 361 miles of range, ultra-fast charging, and futuristic design.',
      price: "42900",
      timePeriod: 'Released mid 2025',
      location: 'Global',
      image: 'https://via.placeholder.com/150?text=Hyundai+Ioniq+6',
    ),
    Product(
      id: 'c4',
      category: 'Cars',
      name: 'Ford Mustang Mach-E',
      description:
          'Electric SUV inspired by the Mustang with AWD, sporty performance, and 300+ mile range.',
      price: "45995",
      timePeriod: '2025 Model',
      location: 'USA, Europe',
      image: 'https://via.placeholder.com/150?text=Mustang+Mach-E',
    ),
    Product(
      id: 'c5',
      category: 'Cars',
      name: 'Honda Civic 2025',
      description:
          'Compact car with efficient engine, spacious interior, and Honda Sensing safety suite.',
      price: "23900",
      timePeriod: '2025 Model',
      location: 'Global',
      image: 'https://via.placeholder.com/150?text=Honda+Civic+2025',
    ),
    Product(
      id: 'c6',
      category: 'Cars',
      name: 'BMW i7',
      description:
          'Luxury electric sedan with advanced tech, dual-motor AWD, and over 300 miles of range.',
      price: "120000",
      timePeriod: 'Launched 2025',
      location: 'Europe, USA',
      image: 'https://via.placeholder.com/150?text=BMW+i7',
    ),
  ];

  List<Product> get products => _products;

  void setProducts(List<Product> items) {
    _products += items;
    notifyListeners();
  }

  Product getById(String id) {
    return _products.firstWhere((prod) => prod.id == id);
  }
}
