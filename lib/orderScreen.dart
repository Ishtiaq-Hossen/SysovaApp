import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191A22),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF191A22),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Orders',
          style: TextStyle(color: Colors.white),
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
      bottomNavigationBar: _buildBottomNavigationBar(context, '/orders'),
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
            currentRoute == '/', // Check if selected
          ),
          _buildBottomNavItem(
            context,
            Icons.business,
            'Report',
            '/reports', // Route for Report
            currentRoute == '/', // Check if selected
          ),
          _buildBottomNavItem(
            context,
            Icons.person,
            'Profile',
            '/', // Route for Profile
            currentRoute == '/', // Check if selected
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
          Navigator.pushReplacementNamed(context, route);
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
      displayColor = Colors.red;
    } else if (widget.status == 'Completed' || widget.status == 'Approved') {
      displayText = 'NOD';
      displayColor = Colors.green;
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
          color: const Color(0xFF292B3E),
          borderRadius: BorderRadius.circular(8),
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
                      children: [
                        const Expanded(
                          child: Text(
                            'M/S Vai Vai Treders',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
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
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Code: 123456',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Address: Dhaka',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Phone: 01732222222',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
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
                          color: Colors.grey[400],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '21-Sep-2024',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Order No: 123456789',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Created by: Mehedi Hasan',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Total Amount: BDT 13,200',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
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
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Status: ',
                              style: TextStyle(
                                color: Colors.black,
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
