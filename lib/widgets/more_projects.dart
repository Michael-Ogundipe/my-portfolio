import 'package:flutter/material.dart';

import '../service/url_launcher.dart';

class MoreProjectsWidget extends StatelessWidget {
  const MoreProjectsWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Custom flower icon
          const Icon(
            Icons.spa,
            color: Color(0xFF2942B3),
            size: 32,
          ),
          const SizedBox(height: 16),
          // Title text
          const Text(
            "Of Course, There Are More.",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 24),
          // Button
          OutlinedButton(
            onPressed: () =>launchURl('https://github.com/Michael-Ogundipe'),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              side: const BorderSide(color: Color(0xFF2942B3), width: 1),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              minimumSize: const Size(250, 0),
            ),
            child:  Text(
              "... All $title",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF2942B3),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}