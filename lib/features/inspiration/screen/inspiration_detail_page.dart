import 'package:flutter/material.dart';
import 'package:tread256/core/utils/constants/colors.dart';
import 'package:tread256/features/inspiration/controller/inspiration_controller.dart';

class InspirationDetailPage extends StatelessWidget {
  final InspirationArticle article;

  const InspirationDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,

      body: ListView(
        children: [
          // Image
          ClipRRect(
            child: Image.asset(
              article.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) => Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: const Center(child: Text('Image not found')),
                  ),
            ),
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  article.title.replaceAll('\n', ' '),
                  // Remove unwanted newlines/tabs
                  style: TextStyle(
                    color: const Color(0xff535A6C),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.4, // Added line spacing
                  ),
                ),

                // Fast Description
                Text(
                  article.descriptionFast,
                  style: TextStyle(
                    color: const Color(0xff535A6C),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.5, // Added line spacing
                  ),
                ),

                // Long Description
                Text(
                  article.descriptionLong,
                  style: TextStyle(
                    color: const Color(0xff535A6C),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.5, // Added line spacing
                  ),
                ),

                // Sir1 (Formatted with preserved line breaks and spacing)
                _buildFormattedText(article.sir1),

                // Sir2 (Formatted with preserved line breaks and spacing)
                _buildFormattedText(article.sir2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to handle text with line breaks and emojis
  Widget _buildFormattedText(String text) {
    // Split text by newlines to preserve intentional line breaks
    final lines =
        text.split('\n').where((line) => line.trim().isNotEmpty).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          lines.map((line) {
            return Padding(
              padding: const EdgeInsets.only(
                bottom: 8,
              ), // Increased spacing between lines
              child: Text(
                line.trim(),
                style: TextStyle(
                  color: const Color(0xff535A6C),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.5, // Added line spacing
                ),
              ),
            );
          }).toList(),
    );
  }
}
