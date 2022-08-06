import 'package:coinsconverter/main.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatefulWidget {
  final Uri _urlLinkedin =
      Uri.parse('https://www.linkedin.com/in/guilherme-nogueira-2b40a9237/');

  // Future<void> launchUrlLinkedin() async {
  //   if (!await launchUrl(_urlLinkedin)) {
  //     throw 'Não foi possivel iniciar $_urlLinkedin';
  //   }
  // }

  InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final Uri _urlLinkedin =
      Uri.parse('https://www.linkedin.com/in/guilherme-nogueira-2b40a9237/');

  Future<void> _launchLink(String url) async {
    try {
      bool a = await canLaunchUrl(Uri.parse(url));
      print(a);
      if (a) {
        await launchUrl(Uri.parse(url));
      } else {
        print('Error');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F1F1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .2 / 1,
                  decoration: BoxDecoration(
                    color: Color(0xff191970),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, right: 50, left: 50),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 24, bottom: 12),
                          child: Container(
                            child: Image.asset('assets/icons/iconmoeda.png'),
                            height: MediaQuery.of(context).size.height * .1,
                            width: MediaQuery.of(context).size.width * .2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        Text(
                          'Conversor de moeda',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 12, right: 12, left: 12, bottom: 24),
                          child: Text(
                            'App desenvolvido para trazer ao usuário praticidade e eficiência na cotação das principais moedas ao redor do mundo.',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, right: 50, left: 50),
              child: Container(
                width: MediaQuery.of(context).size.width * 3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 24, 0, 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Guilherme Nogueira',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.code,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'Developer',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                _launchLink(
                                    'https://api.whatsapp.com/send?phone=5585985014866');
                              },
                              splashColor: Color(0xff191970),
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 9,
                                    child: Image.asset(
                                      'assets/icons/iconwhatsapp.png',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    'WhatsApp',
                                    style: Theme.of(context).textTheme.headline3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                _launchLink(
                                    'https://www.linkedin.com/in/guilherme-nogueira-2b40a9237/');
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 9,
                                    child: Image.asset(
                                      'assets/icons/iconlinkedincircle.png',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    'Linkedin',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                _launchLink('https://github.com/GuilhermeNog');
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 9,
                                    child: Image.asset(
                                      'assets/icons/icongithub.png',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    'GitHub',
                                    style:
                                        Theme.of(context).textTheme.headline3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
