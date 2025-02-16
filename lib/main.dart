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

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: AttendanceScreen(),
      // home: DashboardPage(),
      // home: OrdersScreen(),
      // home: OrderTrackingScreen(),
      // home: PlaceOrderScreen(),
      // home: PlaceOrderTwo(),
      // home: ReportPage(),
      // home: ScheduleScreen(),
      // home: TourPlanScreen(),
      home: WeeklyTourPlanScreen(),

    );
  }
}