import 'package:flutter/material.dart';

import '../models/campus_event.dart';

const List<CampusEvent> sampleEvents = [
  CampusEvent(
    title: 'Career Fair 2026',
    date: '12 Nov 2026',
    time: '10:00 AM',
    location: 'Main Auditorium',
    category: 'Career',
    icon: Icons.work_outline,
  ),
  CampusEvent(
    title: 'AI & Data Science Workshop',
    date: '14 Nov 2026',
    time: '2:00 PM',
    location: 'CS Lab 3, Block B',
    category: 'Workshop',
    icon: Icons.psychology_outlined,
  ),
  CampusEvent(
    title: 'Inter-Department Cricket Tournament',
    date: '18 Nov 2026',
    time: '9:00 AM',
    location: 'University Sports Ground',
    category: 'Sports',
    icon: Icons.sports_cricket_outlined,
  ),
  CampusEvent(
    title: 'Final Year Project Expo',
    date: '25 Nov 2026',
    time: '11:00 AM',
    location: 'Exhibition Hall, Block A',
    category: 'Academic',
    icon: Icons.science_outlined,
  ),
  CampusEvent(
    title: 'Mushaira & Literary Evening',
    date: '28 Nov 2026',
    time: '6:30 PM',
    location: 'Library Lawn',
    category: 'Culture',
    icon: Icons.menu_book_outlined,
  ),
  CampusEvent(
    title: 'Blood Donation Camp',
    date: '2 Dec 2026',
    time: '9:30 AM',
    location: 'Student Affairs Office',
    category: 'Community',
    icon: Icons.volunteer_activism_outlined,
  ),
];
