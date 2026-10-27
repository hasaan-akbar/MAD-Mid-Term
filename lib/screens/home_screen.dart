import 'package:flutter/material.dart';

import '../data/sample_events.dart';
import '../models/campus_event.dart';
import '../routes/app_routes.dart';
import '../theme/app_theme.dart';
import '../widgets/app_bottom_navigation.dart';
import '../widgets/app_drawer.dart';
import '../widgets/profile_avatar.dart';
import '../widgets/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CampusEvent> upcoming = sampleEvents.take(3).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('CampusConnect')),
      drawer: const AppDrawer(currentRoute: AppRoutes.home),
      bottomNavigationBar: const AppBottomNavigation(currentIndex: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Assalam-o-Alaikum, Hasaan Akbar',
              style: AppTheme.caption,
            ),
            const SizedBox(height: 4),
            const Text('This week on campus', style: AppTheme.heading),
            const SizedBox(height: 20),
            const _StudentSummary(),
            const SizedBox(height: 24),
            const SectionHeading(title: 'Quick actions'),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _QuickAction(
                    icon: Icons.event_outlined,
                    label: 'Events',
                    onTap: () => Navigator.pushNamed(context, AppRoutes.events),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _QuickAction(
                    icon: Icons.how_to_reg_outlined,
                    label: 'Register',
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.registration),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _QuickAction(
                    icon: Icons.person_outline,
                    label: 'Profile',
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.profile),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SectionHeading(
              title: 'Upcoming events',
              actionLabel: 'See all',
              onAction: () => Navigator.pushNamed(context, AppRoutes.events),
            ),
            const SizedBox(height: 8),
            Material(
              color: AppTheme.white,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: AppTheme.border),
              ),
              child: Column(
                children: [
                  for (int i = 0; i < upcoming.length; i++) ...[
                    if (i > 0) const Divider(height: 1, color: AppTheme.border),
                    _EventRow(event: upcoming[i]),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StudentSummary extends StatelessWidget {
  const _StudentSummary();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.border),
      ),
      child: const Row(
        children: [
          ProfileAvatar(radius: 28),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hasaan Akbar',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textDark,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'BS Software Engineering · Semester 6',
                  style: AppTheme.caption,
                ),
                SizedBox(height: 2),
                Text('SP24-BSE-061', style: AppTheme.caption),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickAction({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        backgroundColor: AppTheme.white,
        foregroundColor: AppTheme.navy,
        padding: const EdgeInsets.symmetric(vertical: 14),
        side: const BorderSide(color: AppTheme.border),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 22, color: AppTheme.teal),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class _EventRow extends StatelessWidget {
  final CampusEvent event;

  const _EventRow({required this.event});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.registration,
        arguments: event.title,
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Icon(event.icon, color: AppTheme.teal),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: AppTheme.sectionTitle.copyWith(fontSize: 15),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${event.date}  ·  ${event.location}',
                    style: AppTheme.caption,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppTheme.textMuted),
          ],
        ),
      ),
    );
  }
}
