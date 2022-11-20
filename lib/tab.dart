import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  const TabButton({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return (Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Icon(
              icon,
              color: const Color(0xFF42A3FF),
              size: 45,
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              label,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w100),
            ),
          ],
        ),
      ],
    ));
  }
}
