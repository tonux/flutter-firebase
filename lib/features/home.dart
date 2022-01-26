import 'package:flutter/material.dart';
import 'package:flutter_sn/features/events.dart';
import 'package:flutter_sn/services/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EventsPage()));
              },
              child: Text('Events'))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Text('HomePage'),
            ElevatedButton(
              onPressed: () {
                authService.signOut();
              },
              child: Text('Deconexion'),
            ),
          ],
        ),
      ),
    );
  }
}
