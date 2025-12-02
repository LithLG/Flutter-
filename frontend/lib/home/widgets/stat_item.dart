import 'package:flutter/material.dart';

class StatItem extends StatelessWidget {
  final String number;
  final String text;
  final bool isMobile;
  final Color textColor; 
  final Color greyTextColor; 

  const StatItem({
    required this.number,
    required this.text,
    required this.isMobile,
    required this.textColor,
    required this.greyTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: isMobile ? 36 : 48,
            fontWeight: FontWeight.w800,
            color: textColor, 
          ),
        ),
        SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(
            fontSize: isMobile ? 14 : 18,
            color: greyTextColor, 
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}