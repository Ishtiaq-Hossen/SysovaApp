import 'package:flutter/material.dart';

import 'globalColors.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color(0xFFea5a5a),  // Background color updated to white
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 70.0,
          backgroundColor: ScaffholdColor,
          // Navbar color changed to #1095B7
          title: Text(
            'S Y S N O V A',
            style: TextStyle(color: textColorLight, fontWeight: FontWeight.bold),
          ),

          // actions: [
          //   IconButton(
          //     icon: SizedBox(
          //       width: 24, // Adjust size as needed
          //       height: 24,
          //       child: Image.asset('assets/images/icons/notification.png'),
          //     ),
          //     onPressed: () {},
          //   ),
          // ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Section
                Container(
                  decoration: BoxDecoration(
                      color: cardColorLight,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: textColorDark,
                          blurRadius: 5.0,
                        ),
                      ]),
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        // backgroundColor: Colors.red[700],
                        child: Image.asset(
                          'assets/images/icons/woman.png',
                          // Replace with the correct image path
                          width: 40, // Adjust the width as needed
                          height: 40, // Adjust the height as needed
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ms. Mahmuda Islam',
                            style: TextStyle(
                              color: textColorDark,
                              // Text color updated to black
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'CEO',
                            style: TextStyle(
                              color: textColorDarkGrey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                _buildSectionTitle('Dash Board', buttonBlue),
                // Blue color for section title
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildDashboardCard(
                        'Order (Carton)',
                        '200',
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildDashboardCard(
                        'Collection (BDT)',
                        '2,30,000',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
      
                // Plan & Attend Section
                _buildSectionTitle('Plan & Attend (PA)', iconColorDark),
                // Green color for section title
                const SizedBox(height: 16),
                _buildGridSection([
                  GridItem(Image.asset('assets/images/icons/weeklyPlan.png'),
                      'Weekly\nplan', '/weekly_plan'),
                  GridItem(Image.asset('assets/images/icons/schedule.png'),
                      'My\nSchedule', '/schedule'),
                  GridItem(Image.asset('assets/images/icons/attendence.png'),
                      'Attendance', '/attendance'),
                  GridItem(
                      Image.asset('assets/images/icons/leaveApplication.png'),
                      'Leave\nRequest',
                      '/'),
                ]),
      
                const SizedBox(height: 24),
      
                // Sales & Collection Section
                _buildSectionTitle(
                    'Sales & Collection Activities (SCA)', iconColor),
                // Yellow color for section title
                const SizedBox(height: 16),
                _buildGridSection([
                  GridItem(Image.asset('assets/images/icons/placeOrder.png'),
                      'Place Order', '/place_order'),
                  GridItem(Image.asset('assets/images/icons/tracking.png'),
                      'Track Order', '/orders'),
                  GridItem(Image.asset('assets/images/icons/collection.png'),
                      'Collection', '/'),
                ]),
      
                const SizedBox(height: 24),
      
                // Dashboard Section

              ],
            ),
          ),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return Row(
      children: [

        Icon(
          Icons.list_alt_outlined,
          color: iconColor,
        ),
        SizedBox(
          width: 5,
          height: 0,
        ),
        Text(
          title,
          style: TextStyle(
            color: color, // Text color updated
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildGridItem(BuildContext context, GridItem item, String route) {
    return GestureDetector(
      onTap: () {
        if (route == '/') {
          _showMyDialog();
        } else {
          Navigator.pushNamed(context, route);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          // border: Border.all(
          //   color: const Color(0xFFe04b4b),
          //   width: 2,
          // ),
          color: cardColorLight,
          borderRadius: BorderRadius.circular(8),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black87,
            //     blurRadius: 3.0,
            //   ),
            // ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 40, height: 40, child: item.icon),
            SizedBox(height: 8),
            // Add maxLines and overflow handling to the Text widget
            Flexible(
              child: Text(
                item.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: textColorDark,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
                maxLines: 2,
                // overflow: TextOverflow.clip,// Limits the number of lines
                // overflow: TextOverflow.ellipsis, // Handles overflow with ellipsis
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridSection(List<GridItem> items) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      childAspectRatio: 1,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: items
          .map((item) => _buildGridItem(context, item, item.route))
          .toList(),
    );
  }

  Widget _buildDashboardCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          // width: 2,
        ),
        color: cardColorLight,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: textColorDark,
            blurRadius: 3.0,
          ),
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: iconColorDark,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: iconColorDark,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.white,
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
        if (route == '/dashboard') {
          Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
        } else if (route == '/reports') {
          Navigator.pushNamed(context, route);
        } else {
          _showMyDialog();
        }
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
                color: iconColorDark,
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

class GridItem {
  final Widget icon;
  final String title;
  final String route;

  GridItem(this.icon, this.title, this.route);
}
