import 'package:flutter/material.dart';

class CommunityTreeScreen extends StatelessWidget {
  const CommunityTreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors and styles
    const green = Color(0xFF6CBBA9);
    const lightGreen = Color(0xFFE6F4F1);
    const cardShadow = [
      BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header with month navigation
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back_ios, color: green),
                    Text(
                      'JAN 2025',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: green,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: green),
                  ],
                ),
              ),
              // Days of week
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (final day in [
                      'MON',
                      'TUE',
                      'WED',
                      'FRI',
                      'SAT',
                      'SUN',
                    ])
                      Column(
                        children: [
                          Text(
                            day,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 4),
                          Icon(Icons.check_circle, color: green, size: 18),
                        ],
                      ),
                  ],
                ),
              ),
              // Tree graphic
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Icon(
                  Icons.nature,
                  size: 180,
                  color: green.withOpacity(0.3),
                ),
              ),
              // Title
              Text(
                'Your Community Tree',
                style: TextStyle(
                  color: green,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              // Community Organizations
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _buildOrgCard(
                      icon: Icons.church,
                      name: 'Grace Community Church',
                      desc:
                          'Weekly food drives and youth mentoring. See ways to serve or donate.',
                      green: green,
                      cardShadow: cardShadow,
                    ),
                    _buildOrgCard(
                      icon: Icons.favorite,
                      name: 'Hope For All',
                      desc:
                          'Homeless outreach and meal programs. Volunteer or support financially.',
                      green: green,
                      cardShadow: cardShadow,
                    ),
                    _buildOrgCard(
                      icon: Icons.school,
                      name: 'Bright Future Fund',
                      desc:
                          'Scholarships and tutoring for local students. Get involved or give.',
                      green: green,
                      cardShadow: cardShadow,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Recommend Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recommend An Organization',
                      style: TextStyle(
                        color: green,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.group, color: green),
                        hintText: 'Organization name',
                        filled: true,
                        fillColor: lightGreen,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Share your reason...',
                        filled: true,
                        fillColor: lightGreen,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('Send Recommendation'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Serving Opportunities
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Serving Opportunities',
                      style: TextStyle(
                        color: green,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: lightGreen,
                              child: Icon(
                                Icons.volunteer_activism,
                                color: green,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Food Drive',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Grace Community Church\nSaturday, 10:00 AM',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: green,
                                    side: BorderSide(color: green),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text('See All'),
                                ),
                                const SizedBox(height: 8),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: const Text('Sign Up'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Bottom Navigation
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNavIcon(Icons.home, 'Home', green),
                    _buildNavIcon(Icons.favorite, 'Intentions', green),
                    _buildNavIcon(Icons.lightbulb, 'Inspiration', green),
                    _buildNavIcon(Icons.person, 'Profile', green),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrgCard({
    required IconData icon,
    required String name,
    required String desc,
    required Color green,
    required List<BoxShadow> cardShadow,
  }) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: green.withOpacity(0.1),
              child: Icon(icon, color: green),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    desc,
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: green,
                    side: BorderSide(color: green),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Serve'),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Donate'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, String label, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color),
        const SizedBox(height: 2),
        Text(label, style: TextStyle(fontSize: 11, color: color)),
      ],
    );
  }
}
