import 'package:flutter/material.dart';

import '../data/sample_events.dart';
import '../theme/app_theme.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _regNoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  static const List<String> _departments = [
    'Computer Science',
    'Software Engineering',
    'Electrical Engineering',
    'Management Sciences',
    'Mathematics',
    'Physics',
  ];

  String? _selectedDepartment;
  String? _selectedEvent;
  bool _argumentsRead = false;
  int _formResetCount = 0; // changing this rebuilds the dropdowns

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Pre-select the event if the previous screen passed its title.
    if (!_argumentsRead) {
      _argumentsRead = true;
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is String && sampleEvents.any((e) => e.title == args)) {
        _selectedEvent = args;
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _regNoController.dispose();
    _emailController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  String? _validateName(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'Full name is required';
    if (text.length < 3) return 'Enter at least 3 characters';
    return null;
  }

  String? _validateRegNo(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'Registration number is required';
    final pattern = RegExp(r'^[A-Za-z]{2}\d{2}-[A-Za-z]{2,4}-\d{3}$');
    if (!pattern.hasMatch(text)) return 'Use the format SP24-BSE-045';
    return null;
  }

  String? _validateEmail(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'Email address is required';
    final pattern = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!pattern.hasMatch(text)) return 'Enter a valid email address';
    return null;
  }

  void _submit() {
    FocusScope.of(context).unfocus();

    final bool isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    final String name = _nameController.text.trim();
    final String event = _selectedEvent ?? '';

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppTheme.teal,
          content: Text('Thank you, $name. You are registered for $event.'),
        ),
      );

    // Clear the form after a successful submission.
    _formKey.currentState!.reset();
    setState(() {
      _selectedDepartment = null;
      _selectedEvent = null;
      _formResetCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Event Registration')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Reserve your seat', style: AppTheme.heading),
              const SizedBox(height: 6),
              const Text(
                'Fill in your details to register for a campus event.',
                style: AppTheme.caption,
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _nameController,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Full name',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                validator: _validateName,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _regNoController,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.characters,
                decoration: const InputDecoration(
                  labelText: 'Registration number',
                  hintText: 'SP24-BSE-045',
                  prefixIcon: Icon(Icons.badge_outlined),
                ),
                validator: _validateRegNo,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: 'Email address',
                  prefixIcon: Icon(Icons.mail_outline),
                ),
                validator: _validateEmail,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                key: ValueKey('department-$_formResetCount'),
                initialValue: _selectedDepartment,
                isExpanded: true,
                decoration: const InputDecoration(
                  labelText: 'Department',
                  prefixIcon: Icon(Icons.apartment_outlined),
                ),
                items: _departments
                    .map(
                      (d) => DropdownMenuItem<String>(value: d, child: Text(d)),
                    )
                    .toList(),
                onChanged: (value) =>
                    setState(() => _selectedDepartment = value),
                validator: (value) =>
                    value == null ? 'Please select your department' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                key: ValueKey('event-$_formResetCount'),
                initialValue: _selectedEvent,
                isExpanded: true,
                decoration: const InputDecoration(
                  labelText: 'Event',
                  prefixIcon: Icon(Icons.event_outlined),
                ),
                items: sampleEvents
                    .map(
                      (e) => DropdownMenuItem<String>(
                        value: e.title,
                        child: Text(e.title, overflow: TextOverflow.ellipsis),
                      ),
                    )
                    .toList(),
                onChanged: (value) => setState(() => _selectedEvent = value),
                validator: (value) =>
                    value == null ? 'Please select an event' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _notesController,
                maxLines: 3,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  labelText: 'Additional information (optional)',
                  alignLabelWithHint: true,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submit,
                child: const Text('Submit registration'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
