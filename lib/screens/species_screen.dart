import 'package:flutter/material.dart';
import 'package:test_app/models/watch_theme.dart';
import 'package:test_app/screens/home_screen.dart';
import 'package:test_app/screens/product_screen.dart';

class SpeciesScreen extends StatelessWidget {
  const SpeciesScreen({super.key, required this.themes, required this.label});

  final String label;
  final List<WatchTheme> themes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF0F172A),
      appBar: SpeciesAppBar(),
      body: GridView.builder(
        itemCount: themes.length,
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: 200,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                InkWell(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductScreen(theme: themes[index]),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    width: 115,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: const Color(0xFF1D2C4E),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          themes[index].imageUrl,
                          width: 35,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            themes[index].name,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
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
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  AppBar SpeciesAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xFF0F172A),
      automaticallyImplyLeading: false,
      title: Align(
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
    );
  }
}
