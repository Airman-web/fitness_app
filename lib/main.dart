import 'package:flutter/material.dart';

void main() {
  runApp(const FitnessApp());
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FitnessHomePage(),
    );
  }
}

class FitnessHomePage extends StatefulWidget {
  const FitnessHomePage({super.key});

  @override
  State<FitnessHomePage> createState() => _FitnessHomePageState();
}

class _FitnessHomePageState extends State<FitnessHomePage> {
  String selectedWorkout = '';

  final List<String> workouts = [
    'Strength',
    'Cardio',
    'Running',
    'Cycling',
    'Yoga',
    'Swimming',
    'Football',
    'Basketball',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitness'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose your workout:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Wrap(
              spacing: 10,
              runSpacing: 10,

              children: workouts.map((workout) {
                return ChoiceChip(
                  label: Text(workout),

                  selected: selectedWorkout == workout,

                  onSelected: (selected) {
                    setState(() {
                      selectedWorkout = workout;
                    });
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 30),

            Text(
              selectedWorkout.isEmpty
                  ? 'No workout selected'
                  : 'Selected workout: $selectedWorkout',

              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}