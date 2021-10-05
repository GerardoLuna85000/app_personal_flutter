import 'package:flutter/material.dart';

class Imagen extends StatefulWidget {
  //const Imagen({ Key? key }) : super(key: key);

  @override
  _ImagenState createState() => _ImagenState();
}

class _ImagenState extends State<Imagen> {
  
  double _valSlider = 100.0;
  bool? _bloqSlide = false;
  bool _bloqSlide2 = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15.0),
        child: Column(
          children: <Widget>[
            _texto1(),
            _crearSlider(),
            //_crearCheckBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
      
    );
  }

  Widget _texto1(){
      // ignore: prefer_const_constructors
      return Text('Mi curriculum',
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0));
    }

Widget _crearSlider(){
  return Slider
  (
    value: _valSlider,
    label: 'Tamaño de la imagen',
    min: 100.0,
    max: 400.0,
    activeColor: Colors.teal,
    onChanged: (_bloqSlide == true || _bloqSlide2 == true)
    ? null 
    :
     (valor){
      setState(() {
        _valSlider = valor;
      });

    },
  );
}

Widget _crearImagen(){
  return Image(
    image: NetworkImage('https://res.cloudinary.com/utsjr/image/upload/v1633414481/images/cv_akarqg.png'),
    width: _valSlider,
    fit: BoxFit.contain,
  );
}

Widget _crearCheckBox(){
  /*return Checkbox(
    value: _bloqSlide,
     onChanged: (valor){
    setState(() {
      _bloqSlide = valor;
    });
  });
}*/
return CheckboxListTile(
  title: Text('Bloquer Slider'),
  value: _bloqSlide,
  onChanged: (valor){
    setState(() {
      _bloqSlide = valor;
    });
  },
); 
}

Widget _crearSwitch(){
  return SwitchListTile(
    title: Text('Bloquear Slider'), 
    value: _bloqSlide2, 
    onChanged: (valor){
      setState(() {
        _bloqSlide2 = valor;
      });
    });
}

}