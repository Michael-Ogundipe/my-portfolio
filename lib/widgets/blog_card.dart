import 'package:flutter/material.dart';
import 'package:flutter_portfolio/models/blog_post.dart';
import 'package:flutter_portfolio/constants/colors.dart';

class BlogCard extends StatelessWidget {
  final BlogPost blogPost;

  const BlogCard({
    super.key,
    required this.blogPost,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              blogPost.title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: CustomColors.primaryDark,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16),
                const SizedBox(width: 5),
                Text(
                  blogPost.date,
                  style: TextStyle(
                    fontSize: 14,
                    color: CustomColors.textDark,
                  ),
                ),
                const SizedBox(width: 20),
                const Icon(Icons.timer, size: 16),
                const SizedBox(width: 5),
                Text(
                  '${blogPost.readTime} min read',
                  style: TextStyle(
                    fontSize: 14,
                    color: CustomColors.textDark,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              blogPost.excerpt,
              style: TextStyle(
                fontSize: 16,
                color: CustomColors.textDark,
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                // Navigate to blog post
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColors.primaryDark,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Read More',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}