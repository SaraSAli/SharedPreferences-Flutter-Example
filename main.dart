import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SharedPrefExample(),
    );
  }
}

class SharedPrefExample extends StatefulWidget {
  const SharedPrefExample({super.key});

  @override
  State<SharedPrefExample> createState() => _SharedPrefExampleState();
}

class _SharedPrefExampleState extends State<SharedPrefExample> {
  final TextEditingController _controller = TextEditingController();
  String _savedUsername = '';
  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedUsername = prefs.getString('username') ?? '';
      _controller.text = _savedUsername;
    });
  }

  Future<void> _saveUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _controller.text);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Username saved successfully!')));

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DisplayUsernameScreen()),
    );
  }

  Future<void> _clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    setState(() {
      _controller.clear();
      _savedUsername = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shared Preferences Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Enter your username:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _saveUsername,
                  child: const Text('Save'),
                ),
                ElevatedButton(
                  onPressed: _clearData,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Clear'),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class DisplayUsernameScreen extends StatefulWidget {
  const DisplayUsernameScreen({super.key});

  @override
  State<DisplayUsernameScreen> createState() => _DisplayUsernameScreenState();
}

class _DisplayUsernameScreenState extends State<DisplayUsernameScreen> {
  String _savedUsername = '';

  @override
  void initState() {
    super.initState();
    _getSavedUsername();
  }

  Future<void> _getSavedUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedUsername = prefs.getString('username') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saved Username')),
      body: Center(
        child: _savedUsername.isEmpty
            ? const Text('No username saved.', style: TextStyle(fontSize: 20))
            : Text(
                'Saved Username: $_savedUsername',
                style: const TextStyle(fontSize: 22, color: Colors.blueAccent),
              ),
      ),
    );
  }
}