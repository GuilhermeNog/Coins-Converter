import 'package:coinsconverter/pages/app/app_page.dart';
import 'package:coinsconverter/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:url_launcher/url_launcher.dart';

void main() async {
  runApp(MyApp());

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xff191970), // status bar color
  ));
}

Future<Map> getData() async {
  var url = Uri.parse(
    'https://api.hgbrasil.com/finance?format=json-cors&key=c5f60fb9',
  );
  http.Response response = await http.get(url);
  return json.decode(response.body);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppPage(),
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
