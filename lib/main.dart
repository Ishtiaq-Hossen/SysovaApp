import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this for orientation control
import 'package:hella/attendenceScreen.dart';
import 'package:hella/dashboardScreen.dart';
import 'package:hella/home_page.dart';
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

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock orientation to portrait mode
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
}


