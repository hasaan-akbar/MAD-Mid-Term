import 'package:flutter/material.dart';

import '../routes/app_routes.dart';
import '../theme/app_theme.dart';
import '../widgets/app_bottom_navigation.dart';
import '../widgets/app_drawer.dart';
import '../widgets/profile_avatar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Profile')),
      drawer: const AppDrawer(currentRoute: AppRoutes.profile),
      bottomNavigationBar: const AppBottomNavigation(currentIndex: 2),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
        child: Column(
          children: [
            const ProfileAvatar(radius: 48),
            const SizedBox(height: 14),
            const Text('Hasaan Akbar', style: AppTheme.heading),
            const SizedBox(height: 4),
            const Text('SP24-BSE-061', style: AppTheme.caption),
            const SizedBox(height: 24),
            const _InfoCard(
              title: 'Academic details',
              rows: [
                _InfoRow(
                  icon: Icons.school_outlined,
                  label: 'Degree program',
                  value: 'BS Software Engineering',
                ),
                _InfoRow(
                  icon: Icons.layers_outlined,
                  label: 'Semester',
                  value: '6th Semester',
                ),
                _InfoRow(
                  icon: Icons.apartment_outlined,
                  label: 'Department',
                  value: 'Computer Science',
                ),
              ],
            ),
            const SizedBox(height: 16),
            const _InfoCard(
              title: 'Contact',
              rows: [
                _InfoRow(
                  icon: Icons.mail_outline,
                  label: 'Email',
                  value: 'sp24-bse-061@student.comsats.edu.pk',
                ),
                _InfoRow(
                  icon: Icons.phone_outlined,
                  label: 'Phone',
                  value: '+92 300 1234567',
                ),
                _InfoRow(
                  icon: Icons.location_on_outlined,
                  label: 'City',
                  value: 'Islamabad',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final List<_InfoRow> rows;

  const _InfoCard({required this.title, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: AppTheme.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppTheme.border),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTheme.sectionTitle),
            const SizedBox(height: 12),
            for (int i = 0; i < rows.length; i++) ...[
              if (i > 0) const Divider(height: 20, color: AppTheme.border),
              rows[i],
            ],
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 22, color: AppTheme.teal),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTheme.caption),
              const SizedBox(height: 2),
              Text(value, style: AppTheme.body),
            ],
          ),
        ),
      ],
    );
  }
}
