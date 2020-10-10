import 'package:cloud_firestore/cloud_firestore.dart';

class Record {
  final String name;
  final String description;
  final int votes;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['description'] != null),
        assert(map['votes'] != null),
        name = map['name'],
        description = map['description'],
        votes = map['votes'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Record<$name:$description:$votes>";
}
