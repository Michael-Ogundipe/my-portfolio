import 'package:flutter/material.dart';
import 'package:flutter_portfolio/models/experience.dart';
import 'package:flutter_portfolio/constants/colors.dart';

class ExperienceCard extends StatelessWidget {
  final Experience experience;

  const ExperienceCard({
    super.key,
    required this.experience,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  experience.company,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.primaryDark,
                  ),
                ),
                Text(
                  '${experience.startDate} - ${experience.endDate}',
                  style: TextStyle(
                    fontSize: 16,
                    color: CustomColors.textDark,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              experience.position,
              style: TextStyle(
                fontSize: 18,
                color: CustomColors.secondaryDark,
              ),
            ),
            const SizedBox(height: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: experience.responsibilities.map((responsibility) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 5, right: 10),
                        child: Icon(
                          Icons.circle,
                          size: 8,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          responsibility,
                          style: TextStyle(
                            fontSize: 16,
                            color: CustomColors.textDark,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}