import 'package:flutter/material.dart';
import 'package:my_personal_app/pages/cv_imagen.dart';
import 'package:my_personal_app/pages/home_page.dart';
import 'package:my_personal_app/pages/intereses_page.dart';
import 'package:my_personal_app/pages/personal_info.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en','US'),
        const Locale('es','ES'),
      ],
      title: 'My personal App',
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/':(BuildContext context) => HomePage(),
        'pinfo':(BuildContext context) => PersonalInfo(),
        'interest':(BuildContext context) => ContacMe(),
        'cv_imagen':(BuildContext context) => Imagen()


      }
    );
  }
}