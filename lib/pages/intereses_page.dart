import 'package:flutter/material.dart';

class ContacMe extends StatefulWidget {
  //const ContacMe({ Key? key }) : super(key: key);

  @override
  _ContacMeState createState() => _ContacMeState();
}

@override

class _ContacMeState extends State<ContacMe> {


  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';
  String _message = '';

  List<String> _municipios =  [ 
    'Amealco',
    'Ezequiel Montes',
    'Amealco',
    'San Juan del Río',
    'Tequisquiapan'
  ];

  String _municipioSeleccionado = '';

  //controller para la fehca
  TextEditingController _fechaController = new TextEditingController();

  @override
  void initialState(){
    clean();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearNombre(),
          Divider(),
          _crearEmail(),
          Divider(),
          _box(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          //_mostrarInformacion(),
          //Divider(),
          Center(
          child: ElevatedButton(
          child: Text('Enviar'),
          onPressed: (){
            _mostrarAlerta(context);
          },
        ),
          )],
      ),
      
    );
  }

  Widget _crearNombre(){
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        counter: Text('Número de letras: ${_nombre.length}'),
        labelText: 'Nombre',
        hintText: 'Nombre de la persona',
        helperText: 'Solo teclea el texto',
        icon: Icon(Icons.account_circle),
        suffix: Icon(Icons.accessibility)
      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;
        });
        
        //print(_nombre);
      },
    );
  }

  Widget _mostrarInformacion(){
    return ListTile(
      title: Text('El nombre es: $_nombre'), 
      subtitle: Text('E-mail: $_email'),
    );
  }

  Widget _crearEmail(){
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        //counter: Text('Número de letras: ${_nombre.length}'),
        labelText: 'Email',
        hintText: 'Email',
       // helperText: 'Solo teclea el correo correcto',
        icon: Icon(Icons.email),
        suffix: Icon(Icons.alternate_email),
      ),
      onChanged: (valor){
        setState(() {
          _email = valor;
        });
        
        //print(_nombre);
      },
    );
  }

  Widget _box(){
    return Container(
  padding: EdgeInsets.all(12),
  child: Column(
    children: <Widget>[
      TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Mensaje',
        ),
      ),
      SizedBox(height: 16,),
      TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Asunto',
          isDense: true,                      // Added this
        ),
      ),
      SizedBox(height: 16,),
      TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Número de telefono',
          isDense: true,                      // Added this
          contentPadding: EdgeInsets.all(8),  // Added this
        ),
      )
    ],
  ),
);
  }

      Widget _crearPassword(){
      return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        //counter: Text('Número de letras: ${_nombre.length}'),
        labelText: 'Mensaje',
        hintText: 'Mensaje',
        helperText: 'Deja tu mensaeje',
        icon: Icon(Icons.blender_sharp),
        suffix: Icon(Icons.blender_rounded),
      ),
      
      onChanged: (valor){
        setState(() {
          _message = valor;
        });
        
        //print(_nombre);
      },
    );
    }

    Widget _crearFecha(BuildContext context){
      return TextField(
        //no permite seleccionar lo del input
        enableInteractiveSelection: false,
        //el controller
        controller: _fechaController,
        
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          hintText: 'Fecha de consulta',
          labelText: 'Fecha de consulta',
          icon: Icon(Icons.calendar_today),
          suffixIcon: Icon(Icons.perm_contact_calendar),
        ),
        onTap: (){
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        },
      );
    }

    _selectDate(BuildContext context) async{
      DateTime? fechaSeleccionada = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1910),
        lastDate: new DateTime(2025),
        //para el idioma
        locale: Locale('es','ES'),
      );
      if(fechaSeleccionada != null){
        setState(() {
          _fecha = fechaSeleccionada.toString();
          //print(_fecha);
          // ****************************************** castear a substring antes de asignar al controller
          _fechaController.text = _fecha;
        });
      }

    }

    //metodo que retorna la lista de municipios como elementos de menú
    List<DropdownMenuItem<String>> getItems() {
      //variable de retorno
      List<DropdownMenuItem<String>> municipios = [];

      //recorremos la lista de _municiops con un ciclo y extraemos 
      //cada unp y lo agregamos a la lista de items
      _municipios.forEach((municipio) {
        municipios.add(DropdownMenuItem(
          child: Text(municipio),
          value: municipio,
        ));
       });
       return municipios;
    }

    Widget _crearDropdown(){
      return Row(
        children: <Widget>[
          Text('Municipio: '),
          DropdownButton(
            items: getItems(),
            onChanged: (municipio) {
              setState(() {
                _municipioSeleccionado = municipio.toString();
              });
            }
          )
        ],
      );
    }

      void _mostrarAlerta(BuildContext context){
        clean();
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          title: Text('Alerta'),
          content: //Text('Soy un texto de alerta :3'),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.all(20.0),
        child: Text('Mensaje Enviado!'),
      ),
            ],
          ),
          actions: <Widget>[
            TextButton(
                child: Text('Aceptar'),
                onPressed: (){
                  clean();
                  Navigator.of(context).pop();
                },
              ),
          ],
        );
      }
    );
    clean();
  }

  void clean(){
    setState(() {
         _nombre = '';
         _email = '';
         _password = '';
         _fecha = '';
         _message = '';
    });
  }
 
  }
