import 'package:flutter/material.dart';

import 'globalColors.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF191A22),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ScaffholdColor,
        leading: BackButton(color: iconColorLight),
        title: Text(
          'Order Summary',
          style: TextStyle(
            color: textColorLight,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Toggle Buttons
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Handle 'Customer Wise' button press
                    },
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      decoration: BoxDecoration(
                        color: buttonGreeen,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12), // Light border for depth
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Customer Wise',
                          style: TextStyle(
                            color: textColorLight,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Handle 'Product Wise' button press
                    },
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      decoration: BoxDecoration(
                        color: boxColorGrey,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: iconColorDark,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Product Wise',
                          style: TextStyle(
                            color: textColorLight,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // --------------------------Table Header--------------------------
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              height: 40,
              decoration: BoxDecoration(
                color: tableHead,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
              ),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'SN',
                          style: TextStyle(
                            color: textColorLight,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    _VerticalDivider(),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'Name',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textColorLight,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    _VerticalDivider(),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'Carton',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textColorLight,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    _VerticalDivider(),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'Amount',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textColorLight,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 2),
            // Gap with body color

            // -------------------------------Table Rows------------------------------------
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              decoration: BoxDecoration(
                color: tableRow,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
              ),
              child: _TableRow(
                sn: '1',
                name: 'Customer A',
                carton: '20',
                amount: '30,000',
              ),
            ),
            const SizedBox(height: 2),
            // Gap with body color
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              decoration: BoxDecoration(
                color: tableRow,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
              ),
              child: _TableRow(
                sn: '1',
                name: 'Customer B',
                carton: '10',
                amount: '15,000',
              ),
            ),
            const SizedBox(height: 2),
            // Gap with body color

            // Total Row
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              decoration: BoxDecoration(
                color: tableTotalRow,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
              ),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'Total',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textColorLight,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    _VerticalDividerV2(),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          '30',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textColorLight,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    _VerticalDividerV2(),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          '45,000',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textColorLight,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
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
          Navigator.pop(context);
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

class _VerticalDivider extends StatelessWidget {
  final Color color;

  const _VerticalDivider({this.color = Colors.white30});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 3,
      color: dividerOrangeColor,
      margin: const EdgeInsets.symmetric(vertical: 8),
    );
  }
}

class _VerticalDividerV2 extends StatelessWidget {
  final Color color;

  const _VerticalDividerV2({this.color = Colors.white30});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 3,
      color: iconColorLight,
      margin: const EdgeInsets.symmetric(vertical: 8),
    );
  }
}

class _TableRow extends StatelessWidget {
  final String sn;
  final String name;
  final String carton;
  final String amount;

  const _TableRow({
    required this.sn,
    required this.name,
    required this.carton,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          const SizedBox(width: 16),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                sn,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColorDark,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          _VerticalDividerV2(),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColorDark,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          _VerticalDividerV2(),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                carton,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColorDark,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          _VerticalDividerV2(),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                amount,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColorDark,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
