import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Información'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              CircleAvatar(
                radius: 50,
                backgroundColor: Color.fromARGB(255, 62, 79, 177),
                child: Icon(Icons.person, size: 60, color: Colors.white),
              ),
              SizedBox(height: 16),
              Text(
                'Ricardo Noriega',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Alumno de Programación 3', style: TextStyle(fontSize: 16)),
              SizedBox(height: 16),
              Text(
                'Proyecto: Calculadora hecha con Flutter\nAño 2026',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}