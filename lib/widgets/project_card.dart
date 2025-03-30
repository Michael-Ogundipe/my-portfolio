import 'package:flutter/material.dart';
import 'package:flutter_portfolio/models/project.dart';
import 'package:flutter_portfolio/constants/colors.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  final bool isPreview;

  const ProjectCard({
    super.key,
    required this.project,
    required this.isPreview,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                project.imagePath,
                height: isPreview ? 150 : 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              project.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: CustomColors.primaryDark,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              project.description,
              style: TextStyle(
                fontSize: 16,
                color: CustomColors.textDark,
              ),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: project.technologies.map((tech) {
                return Chip(
                  label: Text(
                    tech,
                    style: const TextStyle(fontSize: 12),
                  ),
                  backgroundColor: CustomColors.bgLight2,
                );
              }).toList(),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                if (project.demoUrl.isNotEmpty)
                  ElevatedButton(
                    onPressed: () {
                      // Launch demo URL
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.primaryDark,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Live Demo',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                if (project.demoUrl.isNotEmpty && project.githubUrl.isNotEmpty)
                  const SizedBox(width: 10),
                if (project.githubUrl.isNotEmpty)
                  OutlinedButton(
                    onPressed: () {
                      // Launch GitHub URL
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: BorderSide(
                        color: CustomColors.primaryDark,
                      ),
                    ),
                    child: Text(
                      'GitHub',
                      style: TextStyle(
                        fontSize: 14,
                        color: CustomColors.primaryDark,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}