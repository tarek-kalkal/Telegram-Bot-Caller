import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:telegram_bot_caller/services/api_services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'models/bot_reponse.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


String lastMessage = "" ;
late BotResponse? botResponse ;
late final Uri _url = Uri.parse('tel:${lastMessage}');



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Telegram Bot Caller"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'The last received message',
            ),

            lastMessage != null ? Text('${lastMessage}' ,style: Theme.of(context).textTheme.headlineMedium,) : Container(),

            TextButton(onPressed:()=> _launchUrl(), child: Text("Call",style: TextStyle(fontSize: 24),))

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=> getMessages(),
        tooltip: 'Fetch new data',
        child: const Icon(Icons.replay),
      ),
    );
  }



Future getMessages() async {

final BotResponse? response = await ApiServices().getMessages() ;
 final _lastMessage = response!.result.last.message.text.toString() ;


setState(() => lastMessage = _lastMessage.toString());
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
}