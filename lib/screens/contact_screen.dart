import 'package:flutter/material.dart';
import 'package:flutter_portfolio/widgets/app_bar.dart';
import 'package:flutter_portfolio/widgets/footer.dart';
import 'package:flutter_portfolio/constants/colors.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 100,
                vertical: 80,
              ),
              child: Column(
                children: [
                  Text(
                    'Get In Touch',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.primaryDark,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'I\'d love to hear from you!',
                    style: TextStyle(
                      fontSize: 18,
                      color: CustomColors.secondaryDark,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Subject',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            maxLines: 5,
                            decoration: const InputDecoration(
                              labelText: 'Message',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {
                              // Handle form submission
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CustomColors.primaryDark,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Send Message',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Or reach out directly',
                    style: TextStyle(
                      fontSize: 20,
                      color: CustomColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset('assets/icons/email.png', width: 40),
                        onPressed: () {
                          // Launch email
                        },
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        icon: Image.asset('assets/icons/github.png', width: 40),
                        onPressed: () {
                          // Launch GitHub
                        },
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        icon: Image.asset('assets/icons/linkedin.png', width: 40),
                        onPressed: () {
                          // Launch LinkedIn
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}