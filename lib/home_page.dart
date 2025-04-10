import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this for orientation control
import 'package:hella/attendenceScreen.dart';
import 'package:hella/dashboardScreen.dart';
import 'package:hella/logInScreen.dart';
import 'package:hella/orderScreen.dart';
import 'package:hella/orderTracking.dart';
import 'package:hella/placeOrder.dart';
import 'package:hella/placeOrderScreenTwo.dart';
import 'package:hella/reportScreen.dart';
import 'package:hella/scheduleScreen.dart';
import 'package:hella/tourplanScreen.dart';
import 'package:hella/weeklyTourPlan.dart';
import 'animatedSplashScreen.dart';
import 'attendenceScreenV2.dart';
import 'orderSummery.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Navigation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/splash': (context) =>SplashScreen(),
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