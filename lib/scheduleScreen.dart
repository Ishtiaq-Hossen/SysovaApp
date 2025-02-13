import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: const Color(0xFF1A1B25),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1B25),
        elevation: 0,
        title: const Text(
          'My Schedule',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
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
    );
  }

  Widget _buildToggleButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
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
          color: isSelected ? const Color(0xFF1A237E) : const Color(0xFF673AB7),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12), // Reduced padding
      color: const Color(0xFF673AB7),
      child: const Row(
        children: [
          Expanded(
            flex: 3, // Adjusted flex
            child: Text(
              'Tour Type',
              style: TextStyle(color: Colors.white, fontSize: 13), // Reduced font size
            ),
          ),
          SizedBox(width: 4), // Added small spacing
          Text('|', style: TextStyle(color: Colors.white)),
          SizedBox(width: 4),
          Expanded(
            flex: 3, // Adjusted flex
            child: Text(
              'Work Type',
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
          SizedBox(width: 4),
          Text('|', style: TextStyle(color: Colors.white)),
          SizedBox(width: 4),
          Expanded(
            flex: 3, // Adjusted flex
            child: Text(
              'Date',
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
          SizedBox(width: 4),
          Text('|', style: TextStyle(color: Colors.white)),
          SizedBox(width: 4),
          Expanded(
            flex: 4, // Increased flex for status column
            child: Text(
              'Status',
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleItem(ScheduleItem item) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12), // Reduced padding
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4), // Reduced margin
      decoration: BoxDecoration(
        color: const Color(0xFF282935),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3, // Adjusted flex
            child: Text(
              item.tourType,
              style: const TextStyle(color: Colors.white, fontSize: 13),
              overflow: TextOverflow.ellipsis, // Added overflow handling
            ),
          ),
          const SizedBox(width: 4),
          const Text('|', style: TextStyle(color: Colors.grey)),
          const SizedBox(width: 4),
          Expanded(
            flex: 3, // Adjusted flex
            child: Text(
              item.workType,
              style: const TextStyle(color: Colors.white, fontSize: 13),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 4),
          const Text('|', style: TextStyle(color: Colors.grey)),
          const SizedBox(width: 4),
          Expanded(
            flex: 3, // Adjusted flex
            child: Text(
              item.date,
              style: const TextStyle(color: Colors.white, fontSize: 13),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 4),
          const Text('|', style: TextStyle(color: Colors.grey)),
          const SizedBox(width: 4),
          Expanded(
            flex: 4, // Increased flex for status column
            child: Row(
              mainAxisSize: MainAxisSize.min, // Added to prevent row overflow
              children: [
                _buildStatusDot(item.status),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    _getStatusText(item.status),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.more_vert, color: Colors.white, size: 16), // Reduced icon size
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
      color: const Color(0xFF282935),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomNavItem(Icons.home, 'Home', false),
          _buildBottomNavItem(Icons.business, 'Report', false),
          _buildBottomNavItem(Icons.person, 'My Profile', false),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
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