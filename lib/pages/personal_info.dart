
import 'package:flutter/material.dart';
import 'package:flutter/services.Dart';
import 'package:flutter_linkify/flutter_linkify.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información General'),
        actions: <Widget>[
          /*Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://studio.cults3d.com/TKjLzmrCGHmpIKROJj0X29L-jWE=/516x516/filters:format(webp)/https://files.cults3d.com/uploaders/13900911/illustration-file/37059390-6189-4f7c-91c9-03972bc0c716/black%20panther%20face%20mk1.png'),
            ),
          ),*/
          Container(
            margin: EdgeInsets.only(right: 15.0),
            child: CircleAvatar(child: Text('US'),
            backgroundColor: Colors.black,
            ),
          )
        ],
      ),

      body: ListView(
        children: <Widget>[
          _imagenPersonal(),
          _texto(),
          Divider(),
          _texto1(),
          Divider(),
          _texto2(),
          Divider(),
          _card(),
          Divider(),
          Center(
        child: ElevatedButton(
          child: Text('Mostrar alerta'),
          onPressed: (){
            _mostrarAlerta(context);
          },
        ),
      ),
        ],
      ),
    );
  }
    Widget _imagenPersonal(){
      return Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.all(20.0),
        child: FadeInImage(
          image: AssetImage('assets/yoxd.jpg'),
          placeholder: AssetImage('assets/loading-75.gif'),
          width: 300,

          fadeInDuration: Duration(milliseconds: 400),
        ),
      );
    }

    Widget _texto(){
      // ignore: prefer_const_constructors
      return Text('Nombre: Gerardo Daniel Luna Valencia',
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0));
    }
    Widget _texto1(){
      // ignore: prefer_const_constructors
      return Text('Edad: 21 Años',
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0));
    }
    Widget _texto2(){
      // ignore: prefer_const_constructors
      return Text('TSU. Tecnologías de la información',
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0));
    }

    Widget _card(){
      return Card(
        margin: EdgeInsets.only(right: 20.0, left: 20),
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[ 
              ListTile(
              title: Text('Desripcion'),
              subtitle: 
              Text('Soy un estudiante de la Universidad Tecnologica de San Juan del Río, de la carrera de ingeniería en Desarollo y gestión de software, tengo 21 años y me apaciona la tecnología'),
              
            ),
      
        ],
        ),
    );
    }

  void _mostrarAlerta(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          title: Text('El auto de mis sueños'),
          content: //Text('Soy un texto de alerta :3'),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Nissan Skyline R34'),
              Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.all(20.0),
        child: FadeInImage(
          image: NetworkImage('https://img.autocosmos.com/noticias/fotosprinc/NAZ_21802ad96151407084a22adc2ad8ed6b.jpg'),
          placeholder: AssetImage('assets/loading-75.gif'),
          width: 300,

          fadeInDuration: Duration(milliseconds: 400),
        ),
      ),
            ],
          ),
          actions: <Widget>[
            TextButton(
                child: Text('Aceptar'),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            TextButton(
              child: Text('Cancelar'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }




      
}