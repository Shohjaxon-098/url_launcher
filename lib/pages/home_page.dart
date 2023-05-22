import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Url Launcher"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Open All Packages",
                style: GoogleFonts.alike(fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
              Icon(
                CupertinoIcons.down_arrow,
                size: 30,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[500],
                        boxShadow: [
                          BoxShadow(spreadRadius: 1, blurRadius: 0),
                        ],
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.language,
                          size: 30,
                          color: Colors.white.withOpacity(0.9),
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        SizedBox(
                          height: 40,
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () async {
                              Uri uri = Uri.parse("https://instagram.com/");
                              _launcher(uri);
                            },
                            child: Text("Web Instagram"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red[200],
                        boxShadow: [
                          BoxShadow(spreadRadius: 1, blurRadius: 0),
                        ],
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.email_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        SizedBox(
                          height: 40,
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              Uri uri = Uri(
                                scheme: "mailto",
                                path: "otabekovshohjaxon@gmail.com",
                              );
                              _launcher(uri);
                            },
                            child: Text("Email"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.green[200],
                        boxShadow: [
                          BoxShadow(spreadRadius: 1, blurRadius: 0),
                        ],
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          CupertinoIcons.bubble_left,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        SizedBox(
                          height: 40,
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              final Uri uri = Uri(
                                  scheme: "sms",
                                  path: "+998994576678",
                                  queryParameters: <String, String>{
                                    'body': Uri.encodeComponent("Salom")
                                  });
                              _launcher(uri);
                            },
                            child: Text("Messanger"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[200],
                        boxShadow: [
                          BoxShadow(spreadRadius: 1, blurRadius: 0),
                        ],
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.call,
                          size: 30,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 11,
                        ),
                        SizedBox(
                          height: 40,
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              final Uri uri = Uri(
                                scheme: "tel",
                                path: "+998994576678",
                              );
                              _launcher(uri);
                            },
                            child: Text("Caller"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[800],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _launcher(Uri url) async {
  try {
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
      );
    } else {
      throw "Could not launch $url";
    }
  } catch (_) {}

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map(
          (MapEntry<String, String> e) =>
              "${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}",
        )
        .join("&");
  }
}
