import 'package:flutter/material.dart';

import '../models/campus_event.dart';
import '../theme/app_theme.dart';

class EventCard extends StatelessWidget {
  final CampusEvent event;
  final VoidCallback onRegister;

  const EventCard({super.key, required this.event, required this.onRegister});

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
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppTheme.tealTint,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(event.icon, color: AppTheme.teal, size: 24),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.category.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 11,
                          letterSpacing: 0.8,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.teal,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(event.title, style: AppTheme.sectionTitle),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _InfoRow(
              icon: Icons.calendar_today_outlined,
              text: '${event.date}  ·  ${event.time}',
            ),
            const SizedBox(height: 6),
            _InfoRow(icon: Icons.place_outlined, text: event.location),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: onRegister,
                style: TextButton.styleFrom(foregroundColor: AppTheme.navy),
                icon: const Icon(Icons.how_to_reg_outlined, size: 18),
                label: const Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppTheme.textMuted),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: AppTheme.caption,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
