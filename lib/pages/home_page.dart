import 'package:flutter/material.dart';
import 'package:my_personal_app/providers/menu_provider.dart';
import 'package:my_personal_app/utils/icono_util.dart';

class HomePage extends StatelessWidget {
  //const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Personal App'),
      ),
      body: _lista(),
      
    );
  }

  Widget _lista(){
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      }
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context){
    final List<Widget> opciones = [];

    //validar si la data no es null
    if(data == null){
      return [];
    }

    data.forEach((opcion) {
      final tempTitle = ListTile(
        title: Text(opcion['texto']),
        leading: getIcon(opcion['icon']),
        trailing: Icon(Icons.keyboard_arrow_right,
        color: Colors.blue),
        onTap: (){
          Navigator.pushNamed(context, opcion['ruta']);
        },
      );
      opciones.add(tempTitle);
      opciones.add(Divider());
    });
    return opciones;
  }


}