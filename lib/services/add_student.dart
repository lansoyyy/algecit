import 'package:cloud_firestore/cloud_firestore.dart';

Future addStudent(name, id, number) async {
  final docUser = FirebaseFirestore.instance.collection('Students').doc(id);

  final json = {
    'name': name,
    'id': id,
    'number': number,
    'dateTime': DateTime.now(),
  };

  await docUser.set(json);
}
