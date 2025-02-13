import 'package:flutter/material.dart';

class PlaceOrderTwo extends StatefulWidget {
  const PlaceOrderTwo({Key? key}) : super(key: key);

  @override
  State<PlaceOrderTwo> createState() => _PlaceOrderTwoState();
}

class _PlaceOrderTwoState extends State<PlaceOrderTwo> {
  DateTime selectedDate = DateTime.now();
  String selectedProduct = "Adecko 24 EC";
  String selectedPackSize = "40x25ml";

  List<Map<String, dynamic>> orderList = [
    {"product": "Adecko 24 EC", "packSize": "40x25ml", "tp": 9900, "carton": 3},
    {"product": "Adecko 24 EC", "packSize": "40x25ml", "tp": 3300, "carton": 1},
  ];

  void _incrementCarton(int index) {
    setState(() {
      orderList[index]["carton"] += 1;
    });
  }

  void _decrementCarton(int index) {
    setState(() {
      if (orderList[index]["carton"] > 0) {
        orderList[index]["carton"] -= 1;
      }
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDateSelector(),
              const SizedBox(height: 16),
              _buildCustomerInfo(),
              const SizedBox(height: 16),
              _buildDropdown("Select Product", selectedProduct, ["Adecko 24 EC"], (value) {
                setState(() {
                  selectedProduct = value!;
                });
              }),
              const SizedBox(height: 12),
              _buildDropdown("Select Pack Size", selectedPackSize, ["40x25ml"], (value) {
                setState(() {
                  selectedPackSize = value!;
                });
              }),
              const SizedBox(height: 16),
              _buildProductTable(),
              const SizedBox(height: 16),
              _buildOrderSummary(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomButtons(),
    );
  }

  Widget _buildDateSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("${selectedDate.toLocal()}".split(' ')[0], style: const TextStyle(color: Colors.white, fontSize: 16)),
        ElevatedButton(
          onPressed: () => _selectDate(context),
          child: const Text("Change Date"),
        ),
      ],
    );
  }
  Widget _buildProductTable() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Product List", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Table(
          border: TableBorder.all(color: Colors.white),
          columnWidths: const {
            0: FlexColumnWidth(3),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(2),
            3: FlexColumnWidth(1),
          },
          children: [
            TableRow(
              children: [
                _buildTableHeader("Product"),
                _buildTableHeader("Pack Size"),
                _buildTableHeader("TP (₹)"),
                _buildTableHeader("Cartons"),
              ],
            ),
            for (int i = 0; i < orderList.length; i++)
              TableRow(
                children: [
                  _buildTableCell(orderList[i]["product"]),
                  _buildTableCell(orderList[i]["packSize"]),
                  _buildTableCell(orderList[i]["tp"].toString()),
                  _buildCartonCell(i),
                ],
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildTableHeader(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildTableCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }

  Widget _buildCartonCell(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.remove, color: Colors.white),
          onPressed: () => _decrementCarton(index),
        ),
        Text(orderList[index]["carton"].toString(), style: const TextStyle(color: Colors.white)),
        IconButton(
          icon: const Icon(Icons.add, color: Colors.white),
          onPressed: () => _incrementCarton(index),
        ),
      ],
    );
  }
  Widget _buildCustomerInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Customer Information", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF282838),
            hintText: 'Customer Name',
            hintStyle: const TextStyle(color: Colors.white70),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF282838),
            hintText: 'Customer Address',
            hintStyle: const TextStyle(color: Colors.white70),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF282838),
            hintText: 'Phone Number',
            hintStyle: const TextStyle(color: Colors.white70),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(String label, String value, List<String> items, ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          dropdownColor: const Color(0xFF282838),
          items: items.map((e) => DropdownMenuItem(value: e, child: Text(e, style: const TextStyle(color: Colors.white)))).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF282838),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Order Summary View", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Column(
          children: orderList.map((order) => Text("${order["product"]} - ${order["carton"]} cartons - TP: ${order["tp"]}", style: const TextStyle(color: Colors.white))).toList(),
        ),
      ],
    );
  }

  Widget _buildBottomButtons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("SAVE ORDER"),
            ),
            const SizedBox(width: 8), // Add spacing between buttons
            ElevatedButton(
              onPressed: () {},
              child: const Text("SUBMIT ORDER"),
            ),
          ],
        ),
      ),
    );
  }


}
