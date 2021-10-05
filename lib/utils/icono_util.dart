import 'package:flutter/material.dart';

final _icons = <String,IconData>{
  'add_alert': Icons.add_alert,
  'accessibility' : Icons.accessibility,
  'folder_open' : Icons.folder_open,
};

//metodo que retorna un icono como tal
Icon getIcon(String nombreIcono) {
  return Icon(
    _icons[nombreIcono],
    color: Colors.blue,
  );
}

