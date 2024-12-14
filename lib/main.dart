import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Uri cfUri = Uri.parse('https://watch.cricstream.me/');
  final Uri ccUri = Uri.parse('mailto:shaonroy54@gmail.com');
  final Uri smsNum = Uri.parse('sms:01625023453');
  final Uri phoneNum = Uri.parse('tel:01625023453');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Center(child: Text('Url Launcher')),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SizedBox(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  _launchUrl(cfUri);
                },
                child: const Text('WATCH LIVE CRICKET'),
              ),
              ElevatedButton(
                onPressed: () {
                  _launchUrl(ccUri);
                },
                child: const Text('MAIL ME'),
              ),
              ElevatedButton(
                onPressed: () {
                  _launchUrl(phoneNum);
                },
                child: const Text('CALL ME'),
              ),
              ElevatedButton(
                onPressed: () {
                  _launchUrl(smsNum);
                },
                child: const Text('TEXT ME'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
