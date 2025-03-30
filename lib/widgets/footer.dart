import 'package:flutter/material.dart';
import 'package:flutter_portfolio/constants/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      color: CustomColors.primaryDark,
      child: Column(
        children: [
          const Text(
            'Let\'s work together!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Have a project in mind or want to discuss potential opportunities?',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/contact');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 15,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Contact Me',
              style: TextStyle(
                fontSize: 18,
                color: CustomColors.primaryDark,
              ),
            ),
          ),
          const SizedBox(height: 40),
          const Divider(
            color: Colors.white30,
            thickness: 1,
            indent: 100,
            endIndent: 100,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.email, color: Colors.white),
                onPressed: () {
                  // Launch email
                },
              ),
              const SizedBox(width: 20),
              IconButton(
                icon: const Icon(Icons.code, color: Colors.white),
                onPressed: () {
                  // Launch GitHub
                },
              ),
              const SizedBox(width: 20),
              IconButton(
                icon: const Icon(Icons.work, color: Colors.white),
                onPressed: () {
                  // Launch LinkedIn
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            '© 2023 My Portfolio. All rights reserved.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}