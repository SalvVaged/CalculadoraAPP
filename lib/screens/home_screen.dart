import 'package:flutter/material.dart';
import '../routes/app.routes.dart';
import '../utils/calculator_logic.dart';
import '../widgets/calc_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CalculatorLogic _logic = CalculatorLogic();

  void _refresh(VoidCallback action) {
    setState(action);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Información',
            onPressed: () => Navigator.pushNamed(context, AppRoutes.info),
          ),
        ],
      ),
      body: Column(
        children: [
          
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            color: const Color.fromARGB(255, 202, 224, 243),
            child: Text(
              _logic.display,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 8),
          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(children: [
                    CalcButton(
                      label: 'CE',
                      color: Colors.orange.shade200,
                      onTap: () => _refresh(_logic.clearAll),
                    ),
                    CalcButton(
                      label: 'C',
                      color: Colors.orange.shade200,
                      onTap: () => _refresh(_logic.clearC),
                    ),
                    CalcButton(
                      label: '÷',
                      color: Colors.indigo.shade200,
                      onTap: () => _refresh(() => _logic.setOperator('÷')),
                    ),
                  ]),
                  Row(children: [
                    for (final d in ['7', '8', '9'])
                      CalcButton(
                        label: d,
                        onTap: () => _refresh(() => _logic.inputDigit(d)),
                      ),
                    CalcButton(
                      label: '×',
                      color: Colors.indigo.shade200,
                      onTap: () => _refresh(() => _logic.setOperator('×')),
                    ),
                  ]),
                  Row(children: [
                    for (final d in ['4', '5', '6'])
                      CalcButton(
                        label: d,
                        onTap: () => _refresh(() => _logic.inputDigit(d)),
                      ),
                    CalcButton(
                      label: '-',
                      color: Colors.indigo.shade200,
                      onTap: () => _refresh(() => _logic.setOperator('-')),
                    ),
                  ]),
                  Row(children: [
                    for (final d in ['1', '2', '3'])
                      CalcButton(
                        label: d,
                        onTap: () => _refresh(() => _logic.inputDigit(d)),
                      ),
                    CalcButton(
                      label: '+',
                      color: Colors.indigo.shade200,
                      onTap: () => _refresh(() => _logic.setOperator('+')),
                    ),
                  ]),
                  Row(children: [
                    CalcButton(
                      label: '0',
                      onTap: () => _refresh(() => _logic.inputDigit('0')),
                    ),
                    CalcButton(
                      label: '.',
                      onTap: () => _refresh(_logic.inputDecimal),
                    ),
                    CalcButton(
                      label: '=',
                      color: Colors.indigo.shade400,
                      textColor: Colors.white,
                      onTap: () => _refresh(_logic.equals),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}