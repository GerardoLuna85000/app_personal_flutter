import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider{

  List<dynamic> opciones = [];

  //Constructor
  _MenuProvider(){
    //cargarData();
  }

//metodo para cargar la data del json
Future<List<dynamic>> cargarData() async {
  /*rootBundle.loadString('data/menu.json').then((data) {
      //print(data);
      Map dataMap = json.decode(data);
     // print(dataMap);
     // print(dataMap['nombreApp']);
     // print(dataMap['rutas']);
      opciones = dataMap['rutas'];
    });*/

    final resp = await rootBundle.loadString('data/menu.json');
    Map dataMap = json.decode(resp);
    opciones = dataMap['rutas'];

    return opciones;
}

}

final menuProvider = new _MenuProvider();