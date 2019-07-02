import 'package:community/models/user.dart';

class Event {
  final String title, description;
  final int id;
  final User user;

  Event({
    this.user,
    this.title,
    this.description,
    this.id,
  });
}
