import 'package:flutter/material.dart';

import 'globalColors.dart';

class AttendanceReport extends StatefulWidget {
  const AttendanceReport({Key? key}) : super(key: key);

  @override
  State<AttendanceReport> createState() => _AttendanceReportState();
}

class _AttendanceReportState extends State<AttendanceReport> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color(0xFFea5a5a),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ScaffholdColor,
          leading: BackButton(color: textColorLight),
          title: Text(
            'Attendance Report',
            style: TextStyle(
              color: textColorLight,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            children: [
          Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(12),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// **Date & Source Row**
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '23-Nov-2024',
                    style: TextStyle(
                      color: textColorDark,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: textColorLight, // Background for contrast
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.smartphone, size: 16, color: iconColorDark),
                            const SizedBox(width: 4),
                            Text(
                              'From Mobile',
                              style: TextStyle(
                                color: iconColorDark,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.bus_alert, size: 16, color: iconColorDark),
                            const SizedBox(width: 4),
                            Text(
                              'Dealer Contact',
                              style: TextStyle(
                                color: iconColorDark,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
      
              /// **Tour Type**
              // Row(
              //   children: [
              //     const Icon(Icons.tour, size: 18, color: Colors.black),
              //     const SizedBox(width: 6),
              //     const Text(
              //       'Tour Type: ',
              //       style: TextStyle(
              //         color: Colors.black,
              //         fontSize: 14,
              //         fontWeight: FontWeight.w600,
              //       ),
              //     ),
              //     const Text(
              //       'Dealer Contact',
              //       style: TextStyle(
              //         color: Colors.black,
              //         fontSize: 14,
              //         fontWeight: FontWeight.w500,
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 16),
      
              /// **Details (In/Out Time & Workplaces)**
              const InfoRow(icon: Icons.access_time, label: 'In Time:', value: '9:30 AM'),
              const SizedBox(height: 12),
              const InfoRow(icon: Icons.location_on, label: 'In Workplace:', value: 'Panthapoth'),
              const SizedBox(height: 12),
              const InfoRow(icon: Icons.access_time, label: 'Out Time:', value: '6:30 PM'),
              const SizedBox(height: 12),
              const InfoRow(icon: Icons.location_on, label: 'Out Workplace:', value: 'Gulshan'),
            ],
          ),
        ),
            ],
          ),
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

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: iconColorDark),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            color: textColorDark,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: TextStyle(
            color: textColorDark,
            fontSize: 14,
            // fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}