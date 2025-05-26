import 'package:flutter/material.dart';
import 'package:tread256/core/utils/constants/colors.dart';

class HeaderSection extends StatelessWidget {
  final String headerText;
  final String immagePath;
  final double? boxHeight;
  const HeaderSection({
    super.key,
    required this.headerText,
    required this.immagePath,
    this.boxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(50),
              image: DecorationImage(
                image: AssetImage(immagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: boxHeight),
          Text(
            headerText,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
