import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:web5/program_data.dart';

class CasosScreen extends StatelessWidget {

  Widget _buildListTile(BuildContext context, Caso caso) {
    String data = caso.data;
    List<String> datasplit = data.split('-');


    String ordenaData(){
      return datasplit.reversed.toList().join('/');
    };

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Icon(Icons.coronavirus_outlined, color: Colors.red, size: 35,),
        ),
        title: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(text: "Data: ", style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: "${ordenaData()}"),
            ],
          ),
        ),
        subtitle: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(text: "Novos Casos Confirmados: ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange)),
              TextSpan(text: "${caso.casos_novos_confirmados}"),
              TextSpan(text: "\nNovos Obitos Confirmados: ", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
              TextSpan(text: "${caso.obitos_novos_confirmados}"),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Casos COVID-19"),
      ),
      body: Consumer<CasoCatalog>(
        builder: (context, catalog, child) {
          return ListView(
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            children: catalog.items.map((Caso caso) {
              return _buildListTile(context, caso);
            }).toList(),
          );
        },
      ),
    );
  }
}
