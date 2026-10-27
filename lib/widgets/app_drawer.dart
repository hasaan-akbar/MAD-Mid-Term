import 'package:flutter/material.dart';

import '../routes/app_routes.dart';
import '../theme/app_theme.dart';
import 'profile_avatar.dart';

class AppDrawer extends StatelessWidget {
  /// The route of the screen that contains this drawer (to highlight it).
  final String currentRoute;

  const AppDrawer({super.key, required this.currentRoute});

  void _openMain(BuildContext context, String route) {
    Navigator.pop(context); // close the drawer
    if (route == currentRoute) return;
    AppRoutes.goToMain(context, route);
  }

  void _openExtra(BuildContext context, String route) {
    Navigator.pop(context); // close the drawer
    if (route == currentRoute) return;
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.offWhite,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            width: double.infinity,
            color: AppTheme.navy,
            padding: const EdgeInsets.fromLTRB(20, 56, 20, 20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProfileAvatar(radius: 30),
                SizedBox(height: 12),
                Text(
                  'Hasaan Akbar',
                  style: TextStyle(
                    color: AppTheme.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'SP24-BSE-061',
                  style: TextStyle(color: AppTheme.white, fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _DrawerItem(
            icon: Icons.home_outlined,
            label: 'Home',
            selected: currentRoute == AppRoutes.home,
            onTap: () => _openMain(context, AppRoutes.home),
          ),
          _DrawerItem(
            icon: Icons.event_outlined,
            label: 'Campus Events',
            selected: currentRoute == AppRoutes.events,
            onTap: () => _openMain(context, AppRoutes.events),
          ),
          _DrawerItem(
            icon: Icons.person_outline,
            label: 'Student Profile',
            selected: currentRoute == AppRoutes.profile,
            onTap: () => _openMain(context, AppRoutes.profile),
          ),
          const Divider(height: 24, indent: 16, endIndent: 16),
          _DrawerItem(
            icon: Icons.how_to_reg_outlined,
            label: 'Event Registration',
            selected: currentRoute == AppRoutes.registration,
            onTap: () => _openExtra(context, AppRoutes.registration),
          ),
          _DrawerItem(
            icon: Icons.info_outline,
            label: 'About CampusConnect',
            selected: currentRoute == AppRoutes.about,
            onTap: () => _openExtra(context, AppRoutes.about),
          ),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      selected: selected,
      selectedColor: AppTheme.teal,
      selectedTileColor: AppTheme.tealTint,
      iconColor: AppTheme.textMuted,
      textColor: AppTheme.textDark,
      onTap: onTap,
    );
  }
}
