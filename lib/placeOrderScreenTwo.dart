import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      body: SingleChildScrollView(
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
                    Row(
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
                        const Text(
                          '21-Nov-2024',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white, // White border color
                          width: 1, // Border width
                        ),
                        borderRadius: BorderRadius.circular(4), // Optional: Add border radius
                      ),
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.calendar_month, size: 18, color: Colors.white),
                        label: const Text(
                          'Change Date',
                          style: TextStyle(color: Colors.white),
                        ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'M/S Vai Vai Treders',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
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
                    Text(
                      'Code: 123456',
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Address: Dhaka',
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Phone: 01732222222',
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Product Selection
              const Text(
                'Select Product',
                style: TextStyle(
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
                  border: Border.all(
                    color: Colors.white, // White border color
                    width: 2, // Border width
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedProduct,
                    isExpanded: true,
                    dropdownColor: const Color(0xFF282838),
                    style: const TextStyle(color: Colors.white),
                    icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                    items: ['Adecko 24 EC'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedProduct = newValue;
                        });
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Pack Size Selection
              const Text(
                'Select Pack Size',
                style: TextStyle(
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
                  border: Border.all(
                    color: Colors.white, // White border color
                    width: 2, // Border width
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedPackSize,
                    isExpanded: true,
                    dropdownColor: const Color(0xFF282838),
                    style: const TextStyle(color: Colors.white),
                    icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                    items: ['40x25ml'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          selectedPackSize = newValue;
                        });
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Product Information
              const Text(
                'Product Information',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                child: Column(
                  children: [
                    _buildInfoHeader(),
                     const SizedBox(height: 8),
                    _buildInfoRow('Adecko 24 EC', '40x25ml', '9,900', quantity1),
                    const SizedBox(height: 8),
                    _buildInfoRow('Adecko 24 EC', '40x25ml', '3,300', quantity2),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Order Summary
              const Text(
                'Order Summary View',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Container(

                child: Column(
                  children: [
                    _buildSummaryHeader(), const SizedBox(height: 8),
                    _buildSummaryRow('Adecko 24 EC', '40x25ml', '3', '9,900'), const SizedBox(height: 8),
                    _buildSummaryRow('Adecko 24 EC', '40x25ml', '1', '3,300'),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // Reduced border radius
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'SAVE ORDER',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF585858),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // Reduced border radius
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'SUBMIT ORDER',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Color(0xFF4E409E),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'Product',
                      style: TextStyle(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Container(
                  width: 3,
                  height: 20,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'Pack Size',
                      style: TextStyle(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Container(
                  width: 3,
                  height: 20,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                 Expanded(
                  child: Center(
                    child: Text(
                      'TP',
                      style: TextStyle(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Container(
                  width: 3,
                  height: 20,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: Center(
              child: Text(
                'Carton',
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String product, String packSize, String tp, int quantity) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
      height: 30,
      decoration: BoxDecoration(
        color: const Color(0xFF292B3E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      product,
                      style: const TextStyle(color: Colors.white,fontSize: 12 ,fontWeight:FontWeight.bold),
                      overflow: TextOverflow.clip,
                      softWrap: true,
                    ),
                  ),
                ),
                Container(
                  width: 3,
                  height: 20,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      packSize,
                      style: const TextStyle(color: Colors.white,fontSize: 12 ,fontWeight:FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Container(
                  width: 3,
                  height: 20,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      tp,
                      style: const TextStyle(color: Colors.white,fontSize: 12 ,fontWeight:FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Container(
                  width: 3,
                  height: 20,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.remove, color: Colors.white, size: 20),
                  onPressed: () {},
                ),
                // const SizedBox(width: 8),
                Text(
                  quantity.toString(),
                  style: const TextStyle(color: Colors.white,fontSize: 12 ,fontWeight:FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                // const SizedBox(width: 8),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.add, color: Colors.white, size: 20),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
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
            child: Row(
              children: [
                 Expanded(
                  child: Center(
                    child: Text(
                      'Product Name',
                      style: TextStyle(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Container(
                    width: 3,
                    height: 20,
                    color: Colors.orange
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'Pack Size',
                      style: TextStyle(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Container(
                    width: 3,
                    height: 20,
                    color: Colors.orange
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                 Expanded(
                  child: Center(
                    child: Text(
                      'Carton',
                      style: TextStyle(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Container(
                    width: 3,
                    height: 20,
                    color: Colors.orange
                ),
              ],
            ),
          ),
           Expanded(
            flex: 2,
            child: Center(
              child: Text(
                'TP',
                style: TextStyle(color: Colors.white),
                overflow: TextOverflow.ellipsis,
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
      height: 30,
      decoration: BoxDecoration(
        color: const Color(0xFF292B3E),
        borderRadius: BorderRadius.circular(20),
      ), child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      product,
                      style: const TextStyle(color: Colors.white,fontSize: 12 ,fontWeight:FontWeight.bold),
                      overflow: TextOverflow.clip,
                      softWrap: true,
                    ),
                  ),
                ),
                Container(
                    width: 3,
                    height: 20,
                    color: Colors.white
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      packSize,
                      style: const TextStyle(color: Colors.white,fontSize: 12 ,fontWeight:FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Container(
                    width: 3,
                    height: 20,
                    color: Colors.white
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      carton,
                      style: const TextStyle(color: Colors.white,fontSize: 12 ,fontWeight:FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Container(
                  width: 3,
                  height: 20,
                  color: Colors.white
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                tp,
                style: const TextStyle(color: Colors.white,fontSize: 12 ,fontWeight:FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}