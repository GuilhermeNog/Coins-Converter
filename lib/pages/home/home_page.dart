import 'package:coinsconverter/components/WTextField.dart';
import 'package:coinsconverter/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _realController = TextEditingController();
  TextEditingController _dolarController = TextEditingController();
  TextEditingController _euroController = TextEditingController();
  TextEditingController _renmimbiController = TextEditingController();
  TextEditingController _libraController = TextEditingController();

  double real = 0;
  double dolar = 0;
  double euro = 0;
  double renmimbi = 0;
  double libra = 0;
  dynamic realText;
  dynamic dolarText;
  dynamic euroText;
  dynamic renmimbiText;
  dynamic libraText;
  dynamic teste = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F1F1),
      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Text(
                  'Sem conexão á internet',
                  style: Theme.of(context).textTheme.headline1,
                ),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Erro ao carregar dados',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                );
              } else if (snapshot.data != null) {
                dolar = snapshot.data!['results']['currencies']['USD']['buy'];
                euro = snapshot.data!['results']['currencies']['EUR']['buy'];
                renmimbi =
                    snapshot.data!['results']['currencies']['CNY']['buy'];
                libra = snapshot.data!['results']['currencies']['GBP']['buy'];

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      WTextField(
                        controller: _realController,
                        onTap: () {
                          setState(() {
                            _realController.text = '1';
                            _dolarController.clear();
                            _euroController.clear();
                            _renmimbiController.clear();
                            _libraController.clear();
                            _realChanged();
                          });
                        },
                        onChanged: (text) {
                          setState(() {
                            _realChanged(text);
                          });
                        },
                        image: 'assets/images/brasilflag.png',
                        coinText: realText,
                        typeCoin: 'Brazilian Real',
                        dollarSign: 'R\$',
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xff191970),
                        ),
                        height: 1,
                      ),
                      WTextField(
                        controller: _dolarController,
                        onTap: () {
                          setState(() {
                            _dolarController.text = '1';
                            _realController.clear();
                            _euroController.clear();
                            _renmimbiController.clear();
                            _libraController.clear();
                            _dolarChanged();
                          });
                        },
                        onChanged: (text) {
                          setState(() {
                            _dolarChanged(text);
                          });
                        },
                        image: 'assets/images/euaflag.png',
                        coinText: dolarText,
                        typeCoin: 'US Dollar',
                        dollarSign: '\$',
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xff191970),
                        ),
                        height: 1,
                      ),
                      WTextField(
                        controller: _euroController,
                        onTap: () {
                          setState(() {
                            _euroController.text = '1';
                            _dolarController.clear();
                            _realController.clear();
                            _renmimbiController.clear();
                            _libraController.clear();
                            _euroChanged();
                          });
                        },
                        onChanged: (text) {
                          setState(() {
                            _euroChanged(text);
                          });
                        },
                        image: 'assets/images/euroflag.png',
                        coinText: euroText,
                        typeCoin: 'Euro',
                        dollarSign: '€',
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xff191970),
                        ),
                        height: 1,
                      ),
                      WTextField(
                        controller: _renmimbiController,
                        onTap: () {
                          setState(() {
                            _renmimbiController.text = '1';
                            _realController.clear();
                            _dolarController.clear();
                            _euroController.clear();
                            _libraController.clear();
                            _renmimbiChanged();
                          });
                        },
                        onChanged: (text) {
                          setState(() {
                            _renmimbiChanged(text);
                          });
                        },
                        image: 'assets/images/chinaflag.png',
                        coinText: renmimbiText,
                        typeCoin: 'Renminbi',
                        dollarSign: '¥',
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xff191970),
                        ),
                        height: 1,
                      ),
                      WTextField(
                        controller: _libraController,
                        onTap: () {
                          setState(() {
                            _libraController.text = '1';
                            _realController.clear();
                            _dolarController.clear();
                            _euroController.clear();
                            _renmimbiController.clear();
                            _libraChanged();
                          });
                        },
                        onChanged: (text) {
                          setState(() {
                            _libraChanged(text);
                          });
                        },
                        image: 'assets/images/libraflag.png',
                        coinText: libraText,
                        typeCoin: 'British Pound',
                        dollarSign: '£',
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xff191970),
                        ),
                        height: 1,
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Color(0xff191970),
                  ),
                );
              }
          }
        },
      ),
    );
  }

  void _realChanged([text = '1']) {
    double real = double.parse(text);
    dolarText = _dolarController;
    dolarText = (real / dolar).toStringAsFixed(2).toString();
    euroText = _euroController;
    euroText = (real / euro).toStringAsFixed(2).toString();
    renmimbiText = _renmimbiController;
    renmimbiText = (real / renmimbi).toStringAsFixed(2).toString();
    libraText = _libraController;
    libraText = (real / libra).toStringAsFixed(2).toString();
  }

  void _dolarChanged([text = '1']) {
    double dolar = double.parse(text);
    realText = _realController.text;
    realText = (dolar * this.dolar).toStringAsFixed(2).toString();
    euroText = _euroController.text;
    euroText = (dolar * this.dolar / euro).toStringAsFixed(2).toString();
    renmimbiText = _renmimbiController.text;
    renmimbiText =
        (dolar * this.dolar / renmimbi).toStringAsFixed(2).toString();
    libraText = _libraController.text;
    libraText = (dolar * this.dolar / libra).toStringAsFixed(2).toString();
  }

  void _euroChanged([text = '1']) {
    double euro = double.parse(text);
    realText = _realController.text;
    realText = (euro * this.euro).toStringAsFixed(2).toString();
    dolarText = _dolarController.text;
    dolarText = (euro * this.euro / dolar).toStringAsFixed(2).toString();
    renmimbiText = _renmimbiController.text;
    renmimbiText = (euro * this.euro / renmimbi).toStringAsFixed(2).toString();
    libraText = _libraController.text;
    libraText = (euro * this.euro / libra).toStringAsFixed(2).toString();
  }

  void _renmimbiChanged([text = '1']) {
    double renmimbi = double.parse(text);
    realText = _realController.text;
    realText = (renmimbi * this.renmimbi).toStringAsFixed(2).toString();
    dolarText = _dolarController.text;
    dolarText =
        (renmimbi * this.renmimbi / dolar).toStringAsFixed(2).toString();
    euroText = _euroController.text;
    euroText = (renmimbi * this.renmimbi / euro).toStringAsFixed(2).toString();
    libraText = _libraController.text;
    libraText =
        (renmimbi * this.renmimbi / libra).toStringAsFixed(2).toString();
  }

  void _libraChanged([text = '1']) {
    double libra = double.parse(text);
    realText = _realController.text;
    realText = (libra * this.libra).toStringAsFixed(2).toString();
    dolarText = _dolarController.text;
    dolarText = (libra * this.libra / dolar).toStringAsFixed(2).toString();
    euroText = _euroController.text;
    euroText = (libra * this.libra / euro).toStringAsFixed(2).toString();
    renmimbiText = _renmimbiController.text;
    renmimbiText =
        (libra * this.libra / renmimbi).toStringAsFixed(2).toString();
  }
}
