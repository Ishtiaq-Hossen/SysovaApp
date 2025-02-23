import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import this for date formatting

class PlaceOrderTwo extends StatefulWidget {
  const PlaceOrderTwo({Key? key}) : super(key: key);

  @override
  State<PlaceOrderTwo> createState() => _PlaceOrderTwoState();
}

class _PlaceOrderTwoState extends State<PlaceOrderTwo> {
  String selectedProduct = 'Adecko 24 EC';
  String selectedPackSize = '40x25ml';
  int quantity1 = 3;
  int quantity2 = 1;
  DateTime selectedDate = DateTime.now(); // Initially set to current date

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191A22),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1C1E),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Place Order',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Date Section
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF292B3E),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              width: 4,
                              height: 24,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              DateFormat('dd-MMM-yyyy').format(selectedDate), // Display formatted date
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          side: const BorderSide(color: Colors.white),
                        ),
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (newDate != null && newDate != selectedDate) {
                            setState(() {
                              selectedDate = newDate;
                            });
                          }
                        },
                        icon: const Icon(Icons.calendar_month, size: 18, color: Colors.white),
                        label: const Text(
                          'Change Date',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Customer Info
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF282838),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'M/S Vai Vai Treders',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'NOD',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text('Code: 123456', style: TextStyle(color: Colors.grey[400])),
                      Text('Address: Dhaka', style: TextStyle(color: Colors.grey[400])),
                      Text('Phone: 01732222222', style: TextStyle(color: Colors.grey[400])),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Product Selection
                _buildDropdownSection('Select Product', selectedProduct, ['Adecko 24 EC'],
                        (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedProduct = newValue;
                        });
                      }
                    }),
                const SizedBox(height: 16),

                // Pack Size Selection
                _buildDropdownSection('Select Pack Size', selectedPackSize, ['40x25ml'],
                        (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedPackSize = newValue;
                        });
                      }
                    }),
                const SizedBox(height: 24),

                // Order Summary (Fix Overflow using Wrap)
                const Text(
                  'Order Summary View',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                _buildSummaryHeader(),
                _buildSummaryRow('Adecko 24 EC', '40x25ml', '3', '9,900'),
                _buildSummaryRow('Adecko 24 EC', '40x25ml', '1', '3,300'),
                const SizedBox(height: 32),

                // Action Buttons (Fix Overflow using Wrap)
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _buildActionButton('SAVE ORDER', Colors.white, Colors.black),
                    _buildActionButton('SUBMIT ORDER', const Color(0xFF585858), Colors.white),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownSection(String title, String selectedValue, List<String> items, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF282838),
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              isExpanded: true,
              dropdownColor: const Color(0xFF282838),
              style: const TextStyle(color: Colors.white),
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
              items: items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xFF4E409E),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                'Product Name',
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const VerticalDivider(
            color: Colors.orange,
            thickness: 2,
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                'Pack Size',
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const VerticalDivider(
            color: Colors.orange,
            thickness: 2,
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                'Carton',
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const VerticalDivider(
            color: Colors.orange,
            thickness: 2,
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                'TP',
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String product, String packSize, String carton, String tp) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 30,
      decoration: BoxDecoration(
        color: const Color(0xFF292B3E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                product,
                style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const VerticalDivider(
            color: Colors.white,
            thickness: 2,
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                packSize,
                style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const VerticalDivider(
            color: Colors.white,
            thickness: 2,
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                carton,
                style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const VerticalDivider(
            color: Colors.white,
            thickness: 2,
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                tp,
                style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildActionButton(String text, Color bgColor, Color textColor) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
