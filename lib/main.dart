import 'package:flutter/material.dart';
import 'package:hella/attendenceScreen.dart';
import 'package:hella/dashboardScreen.dart';
import 'package:hella/orderScreen.dart';
import 'package:hella/orderTracking.dart';
import 'package:hella/placeOrder.dart';
import 'package:hella/placeOrderScreenTwo.dart';
import 'package:hella/reportScreen.dart';
import 'package:hella/scheduleScreen.dart';
import 'package:hella/tourplanScreen.dart';
import 'package:hella/weeklyTourPlan.dart';
import 'attendenceScreenV2.dart';
import 'orderSummery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Navigation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/dashboard', // Open Dashboard by default
      routes: {
        '/dashboard': (context) => DashboardPage(),
        '/orders': (context) => OrdersScreen(),
        '/tracking': (context) => OrderTrackingScreen(),
        '/place_order': (context) => PlaceOrderScreen(),
        '/place_order2':(context) => PlaceOrderTwo(),
        '/reports': (context) => ReportPage(),
        '/schedule': (context) => ScheduleScreen(),
        '/tour_plan': (context) => TourPlanScreen(),
        '/weekly_plan': (context) => WeeklyTourPlanScreen(),
        '/attendance': (context) => AttendanceScreen(),
        '/attendance_report': (context) => AttendanceReport(),
        '/order_summary': (context) => OrderSummary(),
      },
    );
  }
}
