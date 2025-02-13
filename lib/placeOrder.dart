import 'package:flutter/material.dart';

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
    {"name": "M/S Vai Vai Treders", "code": "123456", "address": "Dhaka", "phone": "01732222222", "status": "NOD"},
    {"name": "M/S Vai Vai Treders", "code": "123456", "address": "Dhaka", "phone": "01732222222", "status": "NOD"},
    {"name": "M/S Vai Vai Treders", "code": "123456", "address": "Dhaka", "phone": "01732222222", "status": "OD"},
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
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Dark theme background
      appBar: AppBar(
        backgroundColor: const Color(0xFF181818),
        title: const Text("Place Order"),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: const [Icon(Icons.more_vert)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Select Customer", style: TextStyle(color: Colors.white, fontSize: 16)),
            const SizedBox(height: 8),

            // Search Bar
            TextField(
              controller: _searchController,
              onChanged: _filterCustomers,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search Customer",
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF282838),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
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
                  return _buildCustomerCard(customer);
                },
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF181818),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.arrow_back), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Report"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "My Profile"),
        ],
      ),
    );
  }

  // Customer Card Widget
  Widget _buildCustomerCard(Map<String, dynamic> customer) {
    bool isOverdue = customer["status"] == "OD";

    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF282838),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Customer Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(customer["name"], style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
                const SizedBox(height: 4),
                Text("Code: ${customer["code"]}", style: TextStyle(color: Colors.grey[400], fontSize: 14)),
                Text("Address: ${customer["address"]}", style: TextStyle(color: Colors.grey[400], fontSize: 14)),
                Text("Phone: ${customer["phone"]}", style: TextStyle(color: Colors.grey[400], fontSize: 14)),
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
    );
  }
}
