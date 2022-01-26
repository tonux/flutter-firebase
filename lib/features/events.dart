import 'package:flutter/material.dart';
import 'package:flutter_sn/features/events_realtime.dart';
import 'package:flutter_sn/models/event.dart';
import 'package:flutter_sn/services/events_service.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  EventsService _eventsService = EventsService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // add event
              _eventsService.addEvent();
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EventsRealTimePage()));
            },
            icon: Icon(Icons.home),
          )
        ],
      ),
      body: Center(
        child: FutureBuilder<dynamic>(
          future: _eventsService.getEvents(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<Event> documents = snapshot.data;
              return ListView(
                children: documents.map((document) {
                  return ListTile(
                    title: Text(document.name),
                    subtitle: Text(document.description),
                  );
                }).toList(),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
