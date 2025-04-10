import 'package:flutter/material.dart';

import 'globalColors.dart';

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({Key? key}) : super(key: key);

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
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
            'Orders Tracking',
            style: TextStyle(color: textColorLight,fontSize: 18,
              fontWeight: FontWeight.w500,),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
              child: Text(
                'Progress Bar',
                style: TextStyle(
                  color: textColorDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: 0.8,
                  backgroundColor: proIndeback,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(proIndeFront),
                  minHeight: 10,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, top: 4),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '80%',
                  style: TextStyle(
                    color: textColorDark,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Status Cards
            _buildStatusCard(
              imagePath: 'assets/images/icons/pending.png',
              title: 'Pending',
              subtitle: 'Your order is still pending',
              isCompleted: true,
            ),
            _buildStatusCard(
              imagePath: 'assets/images/icons/approve (1).png',
              title: 'Approved',
              subtitle: 'Your order has been approved',
              isCompleted: true,
            ),
            _buildStatusCard(
              imagePath: 'assets/images/icons/invoice.png',
              title: 'Invoiced',
              subtitle: 'Your order invoice has been created',
              isCompleted: true,
            ),
            _buildStatusCard(
              imagePath: 'assets/images/icons/tracking.png',
              title: 'Full Delivery',
              subtitle: 'Your order has been fully delivered',
              isCompleted: false,
              isLast: true,
            ),
            const Spacer(),
          ],
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildStatusCard({
    required String imagePath, // Change from IconData to image path
    required String title,
    required String subtitle,
    required bool isCompleted,
    bool isLast = false,
  }){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: cardColorLight,
        borderRadius: BorderRadius.circular(8),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black,
          //     blurRadius: 2.0,
          //   ),
          // ]
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isCompleted
                  ? Colors.blue.withOpacity(0.1)
                  : Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),

            ),
            child: Image.asset(
              imagePath,
              width: 24,
              height: 24,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: textColorDark,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: textColorDark,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          if (isCompleted)
            Container(
              padding: const EdgeInsets.all(4),
              margin: EdgeInsets.all(4),
              // decoration: BoxDecoration(
              //   // color: Colors.white,
              //   shape: BoxShape.circle,
              // ),
              child: Image.asset(
                'assets/images/icons/approve.png',
                // Replace with your image path
                width: 20,
                height: 20,
                fit: BoxFit.cover,
              ),
            ),
          if (!isCompleted)
            Container(
              padding: const EdgeInsets.all(4),
              margin: EdgeInsets.all(4),
              // decoration: BoxDecoration(
              //   // color: Colors.white,
              //   shape: BoxShape.circle,
              // ),
              child: Image.asset(
                'assets/images/icons/signal.png',
                // Replace with your image path
                width: 20,
                height: 20,
                fit: BoxFit.cover,
              ),
            ),
        ],
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
          Navigator.pop(context);
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
                fontWeight: FontWeight.bold),
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
                Text(
                    '⚠️  It looks like you\'ve provided a design without specifying any requirements. To ensure we build exactly what you need, please share details like functionality, features, and any specific preferences.'),
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
