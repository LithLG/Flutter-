import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final bool isMobile;
  final Color backgroundColor;
  final Color textColor;
  final Color greyTextColor;

  const FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.isMobile,
    required this.backgroundColor,
    required this.textColor,
    required this.greyTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? double.infinity : 300,
      margin: isMobile ? EdgeInsets.symmetric(horizontal: 10) : null,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            icon,
            style: TextStyle(fontSize: isMobile ? 40 : 48),
          ),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Text(
            description,
            style: TextStyle(
              color: greyTextColor,
              height: 1.6,
              fontSize: isMobile ? 14 : 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}