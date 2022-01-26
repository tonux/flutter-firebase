import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sn/models/event.dart';
import 'package:flutter_sn/services/events_service.dart';

class EventsRealTimePage extends StatefulWidget {
  const EventsRealTimePage({Key? key}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsRealTimePage> {
  EventsService _eventsService = EventsService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events Real time'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // add event
              _eventsService.addEvent();
            },
          ),
        ],
      ),
      body: Center(
          child: StreamBuilder<QuerySnapshot>(
        stream: _eventsService.getEventsRealTime(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading...');
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> event =
                  document.data()! as Map<String, dynamic>;
              return ListTile(
                title: Text(event['name']),
                subtitle: Text(event['date'].toDate().toString()),
              );
            }).toList(),
          );
        },
      )),
    );
  }
}
