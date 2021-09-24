import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final RoundedLoadingButtonController roundedLoadingButtonController =
      RoundedLoadingButtonController();
  @override
  void initState() {
    launchWebsite("https://www.baustoffhandel-dueck.de");
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      roundedLoadingButtonController.start();
    });
    super.initState();
  }

  Future<void> launchWebsite(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
      SystemNavigator.pop();
    } else
      throw "Counld not launch $url";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: RoundedLoadingButton(
        onPressed: () {},
        controller: roundedLoadingButtonController,
        child: Text(
          "",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 30,
          ),
        ),
      )),
    );
  }
}
