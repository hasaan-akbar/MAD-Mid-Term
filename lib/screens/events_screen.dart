import 'package:flutter/material.dart';

import '../data/sample_events.dart';
import '../routes/app_routes.dart';
import '../theme/app_theme.dart';
import '../widgets/app_bottom_navigation.dart';
import '../widgets/app_drawer.dart';
import '../widgets/event_card.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Events'),
        actions: [
          IconButton(
            icon: const Icon(Icons.how_to_reg_outlined),
            tooltip: 'Event registration',
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.registration),
          ),
        ],
      ),
      drawer: const AppDrawer(currentRoute: AppRoutes.events),
      bottomNavigationBar: const AppBottomNavigation(currentIndex: 1),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Tap Register on an event to sign up.',
                style: AppTheme.caption,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              itemCount: sampleEvents.length,
              itemBuilder: (context, index) {
                final event = sampleEvents[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: EventCard(
                    event: event,
                    onRegister: () => Navigator.pushNamed(
                      context,
                      AppRoutes.registration,
                      arguments: event.title,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
