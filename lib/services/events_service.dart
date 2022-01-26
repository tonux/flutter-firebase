import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_sn/models/event.dart';

class EventsService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  addEvent() async {
    _db.collection('events').add({
      'name': 'Evento 1',
      'description': 'Descripcion del evento 1',
      'date': DateTime.now(),
      'location': 'Calle 1',
    });
  }

  getEvents() async {
    QuerySnapshot snapshot = await _db.collection('events').get();

    return snapshot.docs.map((doc) => Event.fromDocument(doc)).toList();
  }

  getEventsRealTime() {
    Stream<QuerySnapshot> stream = _db.collection('events').snapshots();

    return stream;
  }
}
