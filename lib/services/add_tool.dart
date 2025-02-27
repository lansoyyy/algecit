import 'package:cloud_firestore/cloud_firestore.dart';

Future addTools(name, id) async {
  final docUser = FirebaseFirestore.instance.collection('Tools').doc(id);

  final json = {
    'name': name,
    'id': id,
    'dateTime': DateTime.now(),
  };

  await docUser.set(json);
}
