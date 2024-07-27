import 'dart:convert';
import 'package:http/http.dart' as http;

class Peticion {
  final String key1;
  final String key2;
  final bool key3;

  Peticion({required this.key1, required this.key2, required this.key3});

  factory Peticion.fromJson(Map<String, dynamic> json) {
    return Peticion(
      key1: json['key1'],
      key2: json['key2'],
      key3: json['key3'],
    );
  }
}

class PeticionFinal {
  Future<List<Peticion>> getPeticion() async {
    final url = Uri.https('yesno.wtf', 'api');

    final respuesta = await http.get(url);

    final List<dynamic> data = json.decode(respuesta.body);

    final List<Peticion> nuevaLista = data.map((item) => Peticion.fromJson(item)).toList();

    return nuevaLista;
  }
}