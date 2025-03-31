import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final  homeKey = GlobalKey();
final  projectsKey = GlobalKey();
final  articlesKey = GlobalKey();
final  contactKey = GlobalKey();

launchURl (String url) async {
  final Uri uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $uri';
  }
}

void scrollToSection(GlobalKey key) {
  Scrollable.ensureVisible(
    key.currentContext!,
    duration: Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );
}