class Event {
  String name;
  String description;
  String location;
  String date;

  Event(this.date, this.name, this.description, this.location);

  Event.fromDocument(var doc)
      : name = doc.get('name'),
        description = doc.get('description'),
        location = doc.get('location'),
        date = doc.get('date').toDate().toString();
}
