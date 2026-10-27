import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Shows assets/images/profile.png if you add one later.
/// Until then, the errorBuilder shows a plain icon, so nothing breaks.
class ProfileAvatar extends StatelessWidget {
  final double radius;

  const ProfileAvatar({super.key, this.radius = 32});

  @override
  Widget build(BuildContext context) {
    final double size = radius * 2;

    return ClipOval(
      child: Image.asset(
        'lib/assets/images/profile.png',
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: size,
            height: size,
            color: AppTheme.navy,
            alignment: Alignment.center,
            child: Icon(
              Icons.person,
              size: radius * 1.1,
              color: AppTheme.white,
            ),
          );
        },
      ),
    );
  }
}
