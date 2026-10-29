
import 'package:flutter/material.dart';
import 'routes/app.routes.dart';

void main() => runApp(const CalculadorApp());

class CalculadorApp extends StatelessWidget {
  const CalculadorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(0, 53, 3, 100)),
      ),
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}