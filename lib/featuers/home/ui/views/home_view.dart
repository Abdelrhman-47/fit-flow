import 'package:fit_flow/core/utils/onboarding_prefs.dart';
import 'package:fit_flow/core/utils/user_prefs.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Map<String, dynamic>? _userData;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final data = await PrefHelpers.getUserData();
    setState(() {
      _userData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FitFlow Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _userData == null
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome, ${_userData!['name']}!',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text('Age: ${_userData!['age']}'),
                  Text('Weight: ${_userData!['weight']} kg'),
                  Text('Height: ${_userData!['height']} cm'),
                  Text('Goal: ${_userData!['goal']}'),
                  const SizedBox(height: 20),
                  const Text('Your personalized fitness plan will be here.'),
                ],
              ),
      ),
    );
  }
}