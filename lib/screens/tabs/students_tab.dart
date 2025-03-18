import 'package:algecit/services/add_student.dart';
import 'package:algecit/utils/colors.dart';
import 'package:algecit/widgets/drawer_widget.dart';
import 'package:algecit/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat, toBeginningOfSentenceCase;

class StudentsTab extends StatefulWidget {
  const StudentsTab({super.key});

  @override
  State<StudentsTab> createState() => _StudentsTabState();
}

class _StudentsTabState extends State<StudentsTab> {
  final messageController = TextEditingController();

  String filter = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        onPressed: () {
          addData(context);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      drawer: DrawerWidget(),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: primary,
        title: TextWidget(
          text: 'Students',
          fontSize: 18,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  // Search Bar
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      onChanged: (value) {
                        setState(() {
                          filter = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search Student..',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),

                  // Dropdown Button
                ],
              ),
              SizedBox(
                height: 20,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Students')
                      .where('name',
                          isGreaterThanOrEqualTo:
                              toBeginningOfSentenceCase(filter))
                      .where('name',
                          isLessThan: '${toBeginningOfSentenceCase(filter)}z')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print(snapshot.error);
                      return const Center(child: Text('Error'));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 50),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        ),
                      );
                    }

                    final data = snapshot.requireData;
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(border: TableBorder.all(), columns: [
                        DataColumn(
                          label: TextWidget(
                            text: 'ID Number',
                            fontSize: 14,
                            fontFamily: 'Bold',
                            color: Colors.black,
                          ),
                        ),
                        DataColumn(
                          label: TextWidget(
                            text: 'Name',
                            fontSize: 14,
                            fontFamily: 'Bold',
                            color: Colors.black,
                          ),
                        ),
                        DataColumn(
                          label: TextWidget(
                            text: 'Contact No.',
                            fontSize: 14,
                            fontFamily: 'Bold',
                            color: Colors.black,
                          ),
                        ),
                        DataColumn(
                          label: TextWidget(
                            text: 'Option',
                            fontSize: 14,
                            fontFamily: 'Bold',
                            color: Colors.black,
                          ),
                        ),
                      ], rows: [
                        for (int i = 0; i < data.docs.length; i++)
                          DataRow(cells: [
                            DataCell(
                              GestureDetector(
                                onTap: () {
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) => HistoryScreen(
                                  //           id: data.docs[i]['id'],
                                  //         )));
                                },
                                child: TextWidget(
                                  text: data.docs[i]['id'],
                                  fontSize: 12,
                                  fontFamily: 'Regular',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            DataCell(
                              GestureDetector(
                                onTap: () {
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) => HistoryScreen(
                                  //           id: data.docs[i]['id'],
                                  //         )));
                                },
                                child: TextWidget(
                                  text: data.docs[i]['name'],
                                  fontSize: 12,
                                  fontFamily: 'Regular',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            DataCell(
                              GestureDetector(
                                onTap: () {
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //     builder: (context) => HistoryScreen(
                                  //           id: data.docs[i]['id'],
                                  //         )));
                                },
                                child: TextWidget(
                                  text: data.docs[i]['number'],
                                  fontSize: 12,
                                  fontFamily: 'Regular',
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            DataCell(
                              IconButton(
                                onPressed: () async {
                                  await FirebaseFirestore.instance
                                      .collection('Students')
                                      .doc(data.docs[i].id)
                                      .delete();
                                },
                                icon: Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ])
                      ]),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  addData(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Student'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Action Dropdown (Borrow/Return)
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Student Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

              // ID Number TextField
              TextField(
                controller: idController,
                decoration: InputDecoration(
                  labelText: 'Student ID',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              TextField(
                controller: numberController,
                decoration: InputDecoration(
                  labelText: 'Contact Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            // Save Button
            ElevatedButton(
              onPressed: () {
                // addTools(nameController.text, idController.text);

                addStudent(nameController.text, idController.text,
                    numberController.text);

                nameController.clear();
                idController.clear(); // Save logic here
                numberController.clear();
                Navigator.pop(context); // Close dialog
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
