
import 'package:http/http.dart' as http;
import 'dart:convert';

class Peticion {
  Future<List<dynamic>> getProductos() async {

    final url = Uri.https('yesno.wtf', 'api');

    // Uri.parse(url)

    final respuesta = await http.get(url);

    final data = json.decode(respuesta.body); 

    final List<dynamic> nuevaLista = [];

    for (Map<dynamic,dynamic> item in data) {
      final peticion = item;
      nuevaLista.add(peticion);
    }

    return nuevaLista;
  }
}