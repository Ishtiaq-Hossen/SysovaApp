import 'package:flutter/material.dart';
import 'package:hella/globalColors.dart';
import 'package:hella/home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFea5a5a),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              rgb1,  // Fully opaque
              // Color.fromRGBO(219, 38, 38, 0.8),  // 80% opacity
              rgb2,  // 60% opacity
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image instead of "UI" text
                Container(
                  height:200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: textColorLight,//
                    border: Border.all(
                      color: textColorLight,
                      width: 2.0,
                    ),
                      boxShadow: [
                        BoxShadow(
                          color: textColorDark,
                          blurRadius: 5.0,
                        ),
                      ]
                    // Adjust radius value as needed

                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16), // Same radius as container
                    child: Image.asset(
                      'assets/images/icons/sysnova.png',
                      fit: BoxFit.contain,

                    ),
                  ),
                ),
                // const Text(
                //   'sysnova',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 70,
                //     // fontStyle: FontStyle.italic,
                //   ),
                // ),
                // const SizedBox(height: 30),
                // const Text(
                //   'Welcome Back',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 24,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                const SizedBox(height: 30),
                Text(
                  'Welcome\nSign in to continue',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColorLight,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 48),
                // Email TextField
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: textColorDark,
                          blurRadius: 4.0,
                        ),
                      ],
                          borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    controller: _emailController,
                    style: TextStyle(color: textColorDark),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: textColorLight,
                      hintText: 'Email Address',
                      hintStyle: TextStyle(color: textColorDark),
                      prefixIcon: Icon(Icons.email, color: textColorDarkGrey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(height: 16),
                // Password TextField
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: textColorDark,
                        blurRadius: 4.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    style: TextStyle(color: textColorDark),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: (textColorLight),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: textColorDark),
                      prefixIcon: Icon(Icons.lock, color: textColorDarkGrey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Sign In Button
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: textColorDark,
                        blurRadius: 4.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle sign in logic here
                        Navigator.pushReplacementNamed(context, '/splash');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: textColorLight,
                        foregroundColor: textColorDark,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'SIGN IN',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Create Account Text
                TextButton(
                  onPressed: () {
                    // Handle create account navigation
                  },
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      color: textColorLight,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*Here Login screen code is noted,
SPL white is a whitetheme software for nafco worker
**/

