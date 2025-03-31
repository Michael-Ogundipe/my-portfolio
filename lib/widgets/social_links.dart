import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key, this.isCentered = false});

  final bool isCentered;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isCentered? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        IconButton(
          icon: SvgPicture.asset('assets/svg/github.svg', width: 30),
          onPressed: () async {
            final Uri githubUrl = Uri.parse('https://github.com/Michael-Ogundipe');

            if (await canLaunchUrl(githubUrl)) {
              await launchUrl(githubUrl, mode: LaunchMode.externalApplication);
            } else {
              throw 'Could not launch $githubUrl';
            }
          },
        ),
        const SizedBox(width: 15),
        IconButton(
          icon: SvgPicture.asset('assets/svg/linkedin.svg', width: 30),
          onPressed: () async {
            final Uri githubUrl = Uri.parse('https://www.linkedin.com/in/michael-ogundipe-9a9b8b173/');

            if (await canLaunchUrl(githubUrl)) {
              await launchUrl(githubUrl, mode: LaunchMode.externalApplication);
            } else {
              throw 'Could not launch $githubUrl';
            }
          },
        ),
        const SizedBox(width: 15),
        IconButton(
          icon: SvgPicture.asset('assets/svg/gmail.svg', width: 30),
          onPressed: () async {
            final Uri emailUri = Uri(
              scheme: 'mailto',
              path: 'ogundipeibukun51@gmail.com',
              queryParameters: {
                'subject': 'Hello!',
                'body': 'I wanted to reach out to you...',
              },
            );

            if (await canLaunchUrl(emailUri)) {
              await launchUrl(emailUri);
            } else {
              throw 'Could not launch $emailUri';
            }
          },
        ),
        const SizedBox(width: 15),
        IconButton(
          icon: SvgPicture.asset('assets/svg/x.svg', width: 30),
          onPressed: () async {
            final Uri githubUrl = Uri.parse('https://x.com/syntax007');

            if (await canLaunchUrl(githubUrl)) {
              await launchUrl(githubUrl, mode: LaunchMode.externalApplication);
            } else {
              throw 'Could not launch $githubUrl';
            }
          },
        ),
      ],
    );
  }
}
