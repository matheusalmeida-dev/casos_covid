import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:web5/program_data.dart';
import 'package:web5/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Future<List<Caso>> carregarDados() async {

    final String response =
        await rootBundle.loadString('assets/dados/casos.json');
    final data = await json.decode(response);
    List<Caso> items = [];

    for (var item in data) {
      items.add(Caso.fromJson(item));
    }
    return items;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Caso>>(
      future: carregarDados(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MultiProvider(
            providers: [
              Provider(
                create: (context) => CasoCatalog(snapshot.data),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Casos Covid-19',
              initialRoute: '/',
              routes: {
                '/': (context) => CasosScreen(),
              },
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
