import 'package:flutter/material.dart';

import 'globalColors.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _MySchedulePageState();
}

class _MySchedulePageState extends State<ScheduleScreen> {
  bool isWeeklySelected = true;

  final List<ScheduleItem> scheduleItems = [
    ScheduleItem(
      tourType: 'Deaverser Visit',
      workType: 'Collection',
      date: '21-NOV-2024',
      status: ScheduleStatus.active,
    ),
    ScheduleItem(
      tourType: 'Dealer Visit',
      workType: 'Collection',
      date: '21-NOV-2024',
      status: ScheduleStatus.rejected,
    ),
    ScheduleItem(
      tourType: 'Dealer Visit',
      workType: 'Collection',
      date: '21-NOV-2024',
      status: ScheduleStatus.completed,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color(0xFF1A1B25),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ScaffholdColor,
          elevation: 0,
          title: Text(
            'My Schedule',
            style: TextStyle(
              color: textColorLight,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: iconColorLight),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 16),
            _buildToggleButtons(),
            const SizedBox(height: 24),
            _buildScheduleHeader(),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: scheduleItems.length,
                itemBuilder: (context, index) {
                  return _buildScheduleItem(scheduleItems[index]);
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildToggleButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildToggleButton(
            title: 'Weekly',
            isSelected: isWeeklySelected,
            onTap: () => setState(() => isWeeklySelected = true),
          ),
          const SizedBox(width: 12),
          _buildToggleButton(
            title: 'Monthly',
            isSelected: !isWeeklySelected,
            onTap: () => setState(() => isWeeklySelected = false),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF19611f) : const Color(0xFF535962),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: textColorLight,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

// Previous imports and code remain the same until the _buildScheduleHeader and _buildScheduleItem methods

  Widget _buildScheduleHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: tableHead,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                'Tour Type',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColorLight,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _buildDivider(),
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                'Work Type',
                style: TextStyle(
                  color: textColorLight,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          _buildDivider(),
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                'Date',
                style: TextStyle(
                  color: textColorLight,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _buildDivider(),
          Expanded(
            flex: 4,
            child: Center(
              child: Text(
                'Status',
                style: TextStyle(
                  color: textColorLight,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 20,
      width: 1.5,
      color: Colors.white.withOpacity(0.6),
      // margin: const EdgeInsets.symmetric(horizontal: 8),
    );
  }

  Widget _buildScheduleItem(ScheduleItem item) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
      // Reduced padding
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      // Reduced margin
      decoration: BoxDecoration(
        color: tableRow,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1, // Adjusted flex
            child: Text(
              item.tourType,
              style: TextStyle(color: textColorDark, fontSize: 12,fontWeight: FontWeight.bold),
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,// Added overflow handling
            ),
          ),
          const SizedBox(width: 4),
          // Text('|', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
          _buildDivider(),
          const SizedBox(width: 4),
          Expanded(
            flex: 1, // Adjusted flex
            child: Text(
              item.workType,
              style: TextStyle(color: textColorDark, fontSize: 12,fontWeight: FontWeight.bold),
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 4),
          // Text('|', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
          _buildDivider(),
          const SizedBox(width: 4),
          Expanded(
            flex: 1, // Adjusted flex
            child: Text(
              item.date,
              style: TextStyle(color: textColorDark, fontSize: 12,fontWeight: FontWeight.bold),
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 4),
          // Text('|', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
          _buildDivider(),
          const SizedBox(width: 4),
          Expanded(
            flex: 1, // Increased flex for status column
            child: Row(
              mainAxisSize: MainAxisSize.min, // Added to prevent row overflow
              children: [
                _buildStatusDot(item.status),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    _getStatusText(item.status),
                    style: TextStyle(color: textColorDark, fontSize: 12,fontWeight: FontWeight.bold),
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(Icons.more_vert, color: iconColorLight, size: 13),
                // Reduced icon size
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusDot(ScheduleStatus status) {
    Color color;
    switch (status) {
      case ScheduleStatus.active:
        color = Colors.green;
        break;
      case ScheduleStatus.rejected:
        color = Colors.red;
        break;
      case ScheduleStatus.completed:
        color = Colors.blue;
        break;
    }
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  String _getStatusText(ScheduleStatus status) {
    switch (status) {
      case ScheduleStatus.active:
        return 'Active';
      case ScheduleStatus.rejected:
        return 'Rejected';
      case ScheduleStatus.completed:
        return 'Completed';
    }
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

enum ScheduleStatus {
  active,
  rejected,
  completed,
}

class ScheduleItem {
  final String tourType;
  final String workType;
  final String date;
  final ScheduleStatus status;

  ScheduleItem({
    required this.tourType,
    required this.workType,
    required this.date,
    required this.status,
  });
}
