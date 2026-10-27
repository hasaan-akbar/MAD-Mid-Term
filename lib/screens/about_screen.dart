import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppTheme.navy,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.school,
                  color: AppTheme.white,
                  size: 32,
                ),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('CampusConnect', style: AppTheme.heading),
                    SizedBox(height: 2),
                    Text('Version 1.0.0', style: AppTheme.caption),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'CampusConnect is a simple student companion app. It brings '
            'campus events, event registration and your student details '
            'together in one place.',
            style: AppTheme.body,
          ),
          const SizedBox(height: 24),
          const Text('Purpose', style: AppTheme.sectionTitle),
          const SizedBox(height: 12),
          const _PurposeRow(
            icon: Icons.event_available_outlined,
            text: 'Discover what is happening on campus.',
          ),
          const _PurposeRow(
            icon: Icons.how_to_reg_outlined,
            text: 'Register for events with a short validated form.',
          ),
          const _PurposeRow(
            icon: Icons.person_outline,
            text: 'Keep your academic and contact details in one profile.',
          ),
          const SizedBox(height: 24),
          const Divider(color: AppTheme.border),
          const SizedBox(height: 8),
          const Text(
            'Built as a Flutter project for CSC303 – Mobile Application '
            'Development, COMSATS University Islamabad.',
            style: AppTheme.caption,
          ),
        ],
      ),
    );
  }
}

class _PurposeRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _PurposeRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppTheme.teal, size: 22),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: AppTheme.body)),
        ],
      ),
    );
  }
}
