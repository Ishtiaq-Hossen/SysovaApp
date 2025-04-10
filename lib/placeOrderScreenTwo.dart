import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'globalColors.dart'; // Import this for date formatting

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
    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color(0xFF191A22),
        appBar: AppBar(
          toolbarHeight: 70.0,
          centerTitle: true,
          backgroundColor: ScaffholdColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: iconColorLight),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Place Order',
            style: TextStyle(color: textColorLight,fontSize: 18,
              fontWeight: FontWeight.w500,),
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
                      color: cardColorLight,
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
                                  color: borderColor,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                DateFormat('dd-MMM-yyyy').format(selectedDate), // Display formatted date
                                style: TextStyle(
                                  color: textColorDark,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextButton.icon(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            side: BorderSide(color: iconColorDark),
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
                          icon: Icon(Icons.calendar_month, size: 18, color: iconColorDark),
                          label: Text(
                            'Change Date',
                            style: TextStyle(color: textColorDark),
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
                      color: cardColordark,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'M/S Vai Vai Treders',
                                style: TextStyle(
                                  color: buttonBlue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
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
                              child: Text(
                                'NOD',
                                style: TextStyle(
                                  color: buttonGreeen,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text('Code: 123456', style: TextStyle(color: textColorDark,fontWeight: FontWeight.bold)),
                        Text('Address: Dhaka', style: TextStyle(color: textColorDark,fontWeight: FontWeight.bold)),
                        Text('Phone: 01732222222', style: TextStyle(color: textColorDark,fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
      
                  // Product Selection
                  _buildDropdownSection('Select Product', selectedProduct, ['Napa 25 EC','Adecko 24 EC'],
                          (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedProduct = newValue;
                          });
                        }
                      }),
                  const SizedBox(height: 16),
      
                  // Pack Size Selection
                  _buildDropdownSection('Select Pack Size', selectedPackSize, ['40x25ml','50x30ml'],
                          (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedPackSize = newValue;
                          });
                        }
                      }),
                  const SizedBox(height: 24),
      
                  // Order Summary (Fix Overflow using Wrap)
                  Text(
                    'Order Summary View',
                    style: TextStyle(color: textColorDark, fontSize: 16, fontWeight: FontWeight.w500),
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
                      _buildActionButton('SAVE ORDER', Colors.red, Colors.white),
                      _buildActionButton('SUBMIT ORDER', boxColorGrey, Colors.white),
                    ],
                  ),
                ],
              ),
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
          style: TextStyle(
            color: textColorDark,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: cardColorLight,
            border: Border.all(color: borderColor, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              isExpanded: true,
              dropdownColor: cardColordark,
              style: TextStyle(color: textColorDark),
              icon: Icon(Icons.keyboard_arrow_down, color: iconColorLight),
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
        color: sumhead,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                'Product Name',
                style: TextStyle(color: textColorLight, fontWeight: FontWeight.bold),
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
                style: TextStyle(color: textColorLight, fontWeight: FontWeight.bold),
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
                style: TextStyle(color: textColorLight, fontWeight: FontWeight.bold),
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
                style: TextStyle(color: textColorLight, fontWeight: FontWeight.bold),
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
      // height: 30,
      decoration: BoxDecoration(
        color: tableRow,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                product,
                style: TextStyle(color: textColorDark, fontSize: 12, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
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
                style: TextStyle(color: textColorDark, fontSize: 12, fontWeight: FontWeight.bold),
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
                style: TextStyle(color: textColorDark, fontSize: 12, fontWeight: FontWeight.bold),
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
                style: TextStyle(color: textColorDark, fontSize: 12, fontWeight: FontWeight.bold),
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
