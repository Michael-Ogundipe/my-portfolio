import 'package:flutter/material.dart';
import 'package:flutter_portfolio/widgets/app_bar.dart';
import 'package:flutter_portfolio/widgets/footer.dart';
import 'package:flutter_portfolio/widgets/blog_card.dart';
import 'package:flutter_portfolio/data/blog_data.dart';
import 'package:flutter_portfolio/constants/colors.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

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
                    'My Blog',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.primaryDark,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Thoughts on Flutter, AI, and software development',
                    style: TextStyle(
                      fontSize: 18,
                      color: CustomColors.secondaryDark,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Column(
                    children: blogPosts.map((post) {
                      return BlogCard(blogPost: post);
                    }).toList(),
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