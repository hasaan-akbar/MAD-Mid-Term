import 'package:flutter/material.dart';

class CampusEvent {
  final String title;
  final String date;
  final String time;
  final String location;
  final String category;
  final IconData icon;

  const CampusEvent({
    required this.title,
    required this.date,
    required this.time,
    required this.location,
    required this.category,
    required this.icon,
  });
}
