import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Viagens e Gastos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TripListScreen(), // Chamando a página TripListScreen como a página inicial
    );
  }
}

class TripListScreen extends StatelessWidget {
  final List<String> trips = ['Viagem 1', 'Viagem 2', 'Viagem 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Viagens'),
      ),
      body: ListView.builder(
        itemCount: trips.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(trips[index]),
            onTap: () {
              // Navegar para a tela de gastos ao clicar em uma viagem
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ExpenseListScreen()),
              );
            },
          );
        },
      ),
    );
  }
}

class ExpenseListScreen extends StatelessWidget {
  final List<Expense> expenses = [
    Expense(type: 'Comida', value: 50.0),
    Expense(type: 'Transporte', value: 30.0),
    Expense(type: 'Entretenimento', value: 20.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Gastos'),
      ),
      body: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(expenses[index].type),
            subtitle: Text('R\$ ${expenses[index].value.toStringAsFixed(2)}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Adicionar ação para cadastrar novo gasto
          // Por exemplo, navegar para uma tela de cadastro de gasto
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Expense {
  final String type;
  final double value;

  Expense({required this.type, required this.value});
}
