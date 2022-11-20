import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:test_app/models/watch_theme.dart';
import 'package:test_app/screens/home_screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    super.key,
    required this.theme,
  });
  final WatchTheme theme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: ProductAppBar(),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: Color(0xFF1D2C4E),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        theme.imageUrl,
                        width: 70,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          theme.name,
                          style: const TextStyle(
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 30),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Digital watch face with a similar aesthetic smartwatch W12 Includes pulse, calories and steps.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Cairo',
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          minimumSize: const Size(200, 50),
                          backgroundColor: const Color(0xFF1D2C4E)),
                      onPressed: () => {
                        debugPrint('object'),
                      },
                      child: const Text(
                        'INSTALL',
                        style:
                            TextStyle(fontSize: 25, color: Color(0xFF42A3FF)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF1D2C4E),
        shape: const CircularNotchedRectangle(),
        child: Container(height: 40.0),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment Counter',
        child: Icon(Icons.home),
        backgroundColor: const Color(0xFF42A3FF),
        onPressed: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  AppBar ProductAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFF1D2C4E),
      automaticallyImplyLeading: false,
      title: const Align(
        child: Text(
          'Theme',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
    );
  }
}
