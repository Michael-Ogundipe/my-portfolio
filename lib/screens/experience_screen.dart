import 'package:flutter/material.dart';
import 'package:flutter_portfolio/widgets/app_bar.dart';
import 'package:flutter_portfolio/widgets/footer.dart';
import 'package:flutter_portfolio/widgets/experience_card.dart';
import 'package:flutter_portfolio/data/experience_data.dart';
import 'package:flutter_portfolio/constants/colors.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

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
                    'Experience & Skills',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.primaryDark,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'My professional journey and technical expertise',
                    style: TextStyle(
                      fontSize: 18,
                      color: CustomColors.secondaryDark,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Column(
                    children: experiences.map((experience) {
                      return ExperienceCard(experience: experience);
                    }).toList(),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Technical Skills',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.primaryDark,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Wrap(
                    spacing: 15,
                    runSpacing: 15,
                    children: [
                      _buildSkillChip('Dart'),
                      _buildSkillChip('Flutter'),
                      _buildSkillChip('Firebase'),
                      _buildSkillChip('Riverpod'),
                      _buildSkillChip('REST APIs'),
                      _buildSkillChip('State Management'),
                      _buildSkillChip('Git'),
                      _buildSkillChip('CI/CD'),
                      _buildSkillChip('UI/UX Design'),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Certifications',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.primaryDark,
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildCertificationCard(
                    'Google Flutter Certification',
                    'Issued by Google - 2023',
                  ),
                  const SizedBox(height: 20),
                  _buildCertificationCard(
                    'Dart Programming Masterclass',
                    'Udemy - 2022',
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

  Widget _buildSkillChip(String skill) {
    return Chip(
      label: Text(
        skill,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      backgroundColor: CustomColors.primaryDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget _buildCertificationCard(String title, String subtitle) {
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
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: CustomColors.primaryDark,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 16,
                color: CustomColors.textDark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}