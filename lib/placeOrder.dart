import 'package:flutter/material.dart';
import 'package:hella/placeOrderScreenTwo.dart';

import 'globalColors.dart';

void main() {
  runApp(const MaterialApp(home: PlaceOrderScreen()));
}

class PlaceOrderScreen extends StatefulWidget {
  const PlaceOrderScreen({Key? key}) : super(key: key);

  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> customers = [
    {"name": "M/S Vai Vai Treders", "code": "123456", "address": "Dhaka", "phone": "01732222222", "status": "OD"},
    {"name": "M/S Vai Vai Treders", "code": "123456", "address": "Dhaka", "phone": "01732222222", "status": "NOD"},
    {"name": "Shamol Dada Treders", "code": "123456", "address": "Dhaka", "phone": "01732222222", "status": "NOD"},
    {"name": "M/S Vai Vai Treders", "code": "123456", "address": "Dhaka", "phone": "01732222222", "status": "NOD"},
    {"name": "Sultan Vai Vai Treders", "code": "123456", "address": "Dhaka", "phone": "01732222222", "status": "OD"},
  ];

  List<Map<String, dynamic>> filteredCustomers = [];

  @override
  void initState() {
    super.initState();
    filteredCustomers = customers;
  }

  void _filterCustomers(String query) {
    setState(() {
      filteredCustomers = customers.where((customer) {
        return customer["name"].toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color(0xFF191A22), // Dark theme background
        appBar: AppBar(
          toolbarHeight: 70.0,
          backgroundColor: ScaffholdColor,
          title: const Text("Place Order"),
          centerTitle: true,
          iconTheme: IconThemeData(color: iconColorLight),
          titleTextStyle: TextStyle(color: textColorLight, fontSize: 18, fontWeight: FontWeight.w500),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select Customer", style: TextStyle(color: textColorDark, fontSize: 16)),
      
              const SizedBox(height: 8),
      
              // Search Bar
              TextField(
                controller: _searchController,
                onChanged: _filterCustomers,
                style: TextStyle(color: textColorDark),
                decoration: InputDecoration(
      
                  hintText: "Search Customer",
                  hintStyle: TextStyle(color: boxColorGrey),
                  filled: true,
                  fillColor: cardColorLight,
                  prefixIcon: Icon(Icons.search, color:iconColorDark),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: iconColorLight, // White border color
                      width: 1, // Border width
                    ),
      
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: iconColorLight, // White border color
                      width: 1, // Border width
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color:iconColorLight, // White border color
                      width: 1, // Border width
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
      
              // Customer List
              Expanded(
                child: ListView.builder(
                  itemCount: filteredCustomers.length,
                  itemBuilder: (context, index) {
                    final customer = filteredCustomers[index];
                    return _buildCustomerCard(context, customer);
                  },
                ),
              ),
            ],
          ),
        ),
      
        // Bottom Navigation Bar
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  // Customer Card Widget
  Widget _buildCustomerCard(BuildContext context, Map<String, dynamic> customer) {
    bool isOverdue = customer["status"] == "OD";

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaceOrderTwo(), // Replace with your screen
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: cardColordark,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            // Customer Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    customer["name"],
                    style: TextStyle(
                      color: buttonBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text("Code: ${customer["code"]}", style: TextStyle(color: textColorDark, fontSize: 14,fontWeight: FontWeight.bold)),
                  Text("Address: ${customer["address"]}", style: TextStyle(color: textColorDark, fontSize: 14,fontWeight: FontWeight.bold)),
                  Text("Phone: ${customer["phone"]}", style: TextStyle(color: textColorDark, fontSize: 14,fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            // Status Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isOverdue ? Colors.red.withOpacity(0.1) : Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                customer["status"],
                style: TextStyle(
                  color: isOverdue ? Colors.red : Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: borderColor, // Border color
            width: 5, // Border width
          ),
          // You can omit the other sides if you want no borders on them
          left: BorderSide.none,
          right: BorderSide.none,
          bottom: BorderSide.none,
        ),
        // color: const Color(0xFFE3CECE),
        borderRadius: BorderRadius.circular(30),
      ),
      // color: const Color(0xFFE3CECE),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomNavItem(
            context,
            'assets/images/icons/home.png', // Path to the image asset
            'Home',
            '/dashboard', // Example route for Home screen
            true, // Is selected
          ),
          _buildBottomNavItem(
            context,
            'assets/images/icons/report.png', // Path to the image asset
            'Report',
            '/reports', // Example route for Report screen
            false, // Not selected
          ),
          _buildBottomNavItem(
            context,
            'assets/images/icons/profile.png', // Pth to the image asset
            'Profile',
            '/', // Example route for Profile screen
            false, // Not selected
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(BuildContext context, String imagePath,
      String label, String route, bool isSelected) {
    return GestureDetector(
      onTap: () {
        // For other routes, use Navigator.pushNamed
        if (route == '/dashboard')
          Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
        else if (route == '/reports') {
          Navigator.pushReplacementNamed(context, route);
        } else
          _showMyDialog();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            // color: isSelected ? Colors.white : Colors.grey, // Change image color for selection
            width: 35, // Set width for image
            height: 35, // Set height for image
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              // color: isSelected ? Colors.white : Colors.grey,
                color: textColorDark,
                fontSize: 14,
                fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // icon: Icon(Icons.add_alert, size: 60,),
          // iconColor: Color(0xFFea5a5a),
          title: const Text(
            '🚨 Missing Requirements!',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('⚠️  It looks like you\'ve provided a design without specifying any requirements. To ensure we build exactly what you need, please share details like functionality, features, and any specific preferences.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Okay Understand'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
