import 'package:flutter/material.dart';

import 'globalColors.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color(0xFF191A22),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ScaffholdColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: iconColorLight),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Orders',
            style: TextStyle(color: textColorLight,fontSize: 18,
              fontWeight: FontWeight.w500,),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            OrderCard(
              status: 'Pending',
            ),
            SizedBox(height: 16),
            OrderCard(
              status: 'Approved',
            ),
            SizedBox(height: 16),
            OrderCard(
              status: 'Completed',
            ),
          ],
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
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

  //Its a custom widget for bottom navigation bar
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
              //color: isSelected ? Colors.white : Colors.grey,
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

class OrderCard extends StatefulWidget {
  final String status;

  const OrderCard({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  late String displayText;
  late Color displayColor;

  @override
  void initState() {
    super.initState();
    _updateDisplayTextAndColor();
  }

  void _updateDisplayTextAndColor() {
    if (widget.status == 'Pending') {
      displayText = 'OD';
      displayColor = ScaffholdColor;
    } else if (widget.status == 'Completed' || widget.status == 'Approved') {
      displayText = 'NOD';
      displayColor = buttonGreeen;
    } else {
      displayText = '';
      displayColor = Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/tracking');
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cardColorLight,
          borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: iconColorDark,
                blurRadius: 5.0,
              ),
            ]
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Column
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            'M/S Vai Vai Treders',
                            style: TextStyle(
                              color: textColorDark,
                              fontSize: 15,
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
                            color: displayColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            displayText,
                            style: TextStyle(
                              color: displayColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Code: 123456',
                      style: TextStyle(
                        color: textColorDark,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Address: Dhaka',
                      style: TextStyle(
                        color: textColorDark,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Phone: 01732222222',
                      style: TextStyle(
                        color: textColorRed,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              // Right Column
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 14,
                          color: textColorDark,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '21-Sep-2024',
                          style: TextStyle(
                            color: textColorDark,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Order No: 123456789',
                      style: TextStyle(
                        color: textColorDark,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Created by: Mehedi Hasan',
                      style: TextStyle(
                        color: textColorDark,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Total Amount: BDT 13,200',
                      style: TextStyle(
                        color: buttonBlue,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 120,
                      height: 20,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: boxColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Status: ',
                              style: TextStyle(
                                color: textColorDark,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                            TextSpan(
                              text: widget.status,
                              style: TextStyle(
                                color: widget.status == 'Pending'
                                    ? Colors.red
                                    : widget.status == 'Completed'
                                        ? Colors.green
                                        : widget.status == 'Approved'
                                            ? Colors.blue
                                            : Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
