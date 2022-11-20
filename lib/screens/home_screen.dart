import 'package:flutter/material.dart';
import 'package:test_app/models/watch_theme.dart';
import 'package:test_app/data.dart';
import 'package:test_app/tab.dart';
import 'package:test_app/screens/product_screen.dart';
import '../../screens/species_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF1D2C4E),
        title: const Text(
          'Home',
          style: TextStyle(fontFamily: 'Cairo', fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (final category in data)
                  InkWell(
                    onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SpeciesScreen(
                          themes: category.items,
                          label: category.label,
                        ),
                      ),
                    ),
                    child: TabButton(
                      icon: category.icon,
                      label: category.label,
                    ),
                  ),
              ],
            ),
          ),
          for (final category in data)
            Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        category.label,
                        style: const TextStyle(
                          fontFamily: 'Cairo',
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SpeciesScreen(
                              themes: category.items,
                              label: category.label,
                            ),
                          ),
                        ),
                        child: Container(
                          child: const Text(
                            'More >',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Cairo'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    for (WatchTheme theme in (category.items.length > 3
                        ? category.items.sublist(0, 3)
                        : category.items))
                      Expanded(
                        child: InkWell(
                          onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductScreen(theme: theme),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: const Color(0xFF1D2C4E),
                              ),
                              child: Column(
                                children: [
                                  if (theme.imageUrl.isNotEmpty)
                                    Image.asset(
                                      theme.imageUrl,
                                      width: 35,
                                    ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    theme.name,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                  ],
                )
              ],
            )
        ],
      ),
    );
  }
}
