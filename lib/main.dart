import 'package:ds873/pages/listaviagens_page.dart';
import 'package:flutter/material.dart';
import 'package:ds873/pages/cadastrogastos_page.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Gastos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TripListScreen(),// Chamando a página TripListScreen como a página inicial

    );
  }
}

