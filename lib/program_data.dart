import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:web5/program_data.dart';



/// A estrutura da classe de dados utilizada no aplicativo para
/// armazenar/representar dados de um planeta.
class Caso {
  /// O identificador do planeta.
  final String data;

  /// O caminho da imagem do planeta (na pasta `assets`)
  final String casos_novos_confirmados;

  /// O nome do planeta.
  final String obitos_novos_confirmados;

  Caso(this.data, this.casos_novos_confirmados, this.obitos_novos_confirmados);

  /// Constrói uma instância de [Planet].
  ///
  /// É fornecido como um método estático e o [json] informado como
  /// parâmetro contém um [Map] com as informações do planeta.
  Caso.fromJson(Map<String, dynamic> json)
      : data = json['data'],
        casos_novos_confirmados = json['casos_novos_confirmados'].toString(),
        obitos_novos_confirmados = json['obitos_novos_confirmados'].toString();
}

class CasoCatalog {
  List<Caso> items = [];
  CasoCatalog(this.items);
}

