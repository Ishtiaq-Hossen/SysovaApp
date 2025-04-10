import 'package:flutter/material.dart';
import 'package:hella/dashboardScreen.dart';
import 'package:hella/home_page.dart';

import 'globalColors.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color(0xFFea5a5a),
        appBar: AppBar(
          toolbarHeight: 70.0,
          centerTitle: true,
          backgroundColor: ScaffholdColor,
          elevation: 0,
          title: Text(
            'Report',
            style: TextStyle(
              color:textColorLight,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: iconColorLight),
              onPressed: () {
                if (Navigator.canPop(context)) {
                  print(
                      "Hobe na dada ${Navigator.canPop(context)} \n ==========");
                  Navigator.pop(context);
                } else {
                  print("Hobe dada ${Navigator.canPop(context)} \n ==========");
                  Navigator.pushReplacementNamed(context, '/dashboard');
                }
              }),
          // actions: const [Icon(Icons.more_vert)],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1,
                children: [
                  _buildReportCard(
                    image: AssetImage('assets/images/icons/attendence.png'),
                    // Replace with your image path
                    label: 'Attendence',
                    onTap: () {
                      Navigator.pushNamed(context,'/attendance_report');
                    },
                  ),
                  _buildReportCard(
                    image: AssetImage('assets/images/icons/order.png'),
                    // Replace with your image path
                    label: 'Order',
                    onTap: () {
                      Navigator.pushNamed(context, '/order_summary');
                    },
                  ),
                  _buildReportCard(
                    image: AssetImage('assets/images/icons/collection.png'),
                    // Replace with your image path
                    label: 'Collection',
                    onTap: () {
                      _showMyDialog();
                    },
                  ),
                  _buildReportCard(
                    image: AssetImage('assets/images/icons/stock.png'),
                    // Replace with your image path
                    label: 'Stock',
                    onTap: () {
                      _showMyDialog();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildReportCard({
    required ImageProvider image,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: cardColorLight,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: textColorDark,
              blurRadius: 5.0,
            ),
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: image,
              width: 70, // Adjust size as needed
              height: 70,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: textColorDark,
                fontWeight: FontWeight.bold,
                fontSize: 15,
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
