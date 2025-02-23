import 'package:flutter/material.dart';

class AttendanceReport extends StatelessWidget {
  const AttendanceReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191A22),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF191A22),
        leading: const BackButton(color: Colors.white),
        title: const Text(
          'Attendance Report',
          style: TextStyle(
            color: Colors.white,
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
                color: const Color(0xFF292B3E),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '23-Nov-2024',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'From Mobile',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),),
                            Text(
                              'Tour Type: Dealer Contact',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ]
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Text(
                        'Tour Type: ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Dealer Contact',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const _InfoRow(
                    label: 'In Time:',
                    value: '9:30 AM',
                  ),
                  const SizedBox(height: 12),
                  const _InfoRow(
                    label: 'In Workplace:',
                    value: 'Panthapoth',
                  ),
                  const SizedBox(height: 12),
                  const _InfoRow(
                    label: 'Out Time:',
                    value: '6:30 PM',
                  ),
                  const SizedBox(height: 12),
                  const _InfoRow(
                    label: 'Out Workplace:',
                    value: 'Gulshan',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context, '/'),
    );
  }
  Widget _buildBottomNavigationBar(BuildContext context, String currentRoute) {
    return Container(
      color: const Color(0xFF282935),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomNavItem(
            context,
            Icons.home,
            'Home',
            '/dashboard', // Route for Home
            currentRoute == '/ds', // Check if selected
          ),
          _buildBottomNavItem(
            context,
            Icons.business,
            'Report',
            '/reports', // Route for Report
            currentRoute == '/ds', // Check if selected
          ),
          _buildBottomNavItem(
            context,
            Icons.person,
            'Profile',
            '/', // Route for Profile
            currentRoute == '/ds', // Check if selected
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(BuildContext context, IconData icon, String label,
      String route, bool isSelected) {
    return GestureDetector(
      onTap: () {
        if(route=='/dashboard')
          Navigator.pushNamedAndRemoveUntil(context, route, (route)=>false);
        else if(route=='/reports')
          Navigator.pop(context);
        else
          Navigator.pushNamed(context, route);
      },
      child: Column(
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
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _BottomNavItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
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
      ),
    );
  }
}