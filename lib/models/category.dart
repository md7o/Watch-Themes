import 'package:flutter/widgets.dart';

import 'watch_theme.dart';

class Category {
  final String label;
  final IconData icon;
  final List<WatchTheme> items;

  Category({
    required this.label,
    required this.icon,
    required this.items,
  });
}
