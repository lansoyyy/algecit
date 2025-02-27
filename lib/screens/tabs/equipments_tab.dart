import 'package:algecit/services/add_tool.dart';
import 'package:algecit/utils/colors.dart';
import 'package:algecit/widgets/drawer_widget.dart';
import 'package:algecit/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat, toBeginningOfSentenceCase;
import 'package:intl/intl.dart';

class EquipmentsTab extends StatefulWidget {
  const EquipmentsTab({super.key});

  @override
  State<EquipmentsTab> createState() => _EquipmentsTabState();
}

class _EquipmentsTabState extends State<EquipmentsTab> {
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
          text: 'Tools',
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
                        hintText: 'Search Tool..',
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
                      .collection('Tools')
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
                    return DataTable(border: TableBorder.all(), columns: [
                      DataColumn(
                        label: TextWidget(
                          text: 'ID',
                          fontSize: 14,
                          fontFamily: 'Bold',
                          color: Colors.black,
                        ),
                      ),
                      DataColumn(
                        label: TextWidget(
                          text: 'Tool',
                          fontSize: 14,
                          fontFamily: 'Bold',
                          color: Colors.black,
                        ),
                      ),
                      DataColumn(
                        label: TextWidget(
                          text: 'Date\nAdded',
                          fontSize: 14,
                          fontFamily: 'Bold',
                          color: Colors.black,
                        ),
                      ),
                      DataColumn(
                        label: TextWidget(
                          text: 'Status',
                          fontSize: 14,
                          fontFamily: 'Bold',
                          color: Colors.black,
                        ),
                      ),
                    ], rows: [
                      for (int i = 0; i < data.docs.length; i++)
                        DataRow(cells: [
                          DataCell(
                            TextWidget(
                              text: '${i + 1}',
                              fontSize: 12,
                              fontFamily: 'Regular',
                              color: Colors.black,
                            ),
                          ),
                          DataCell(
                            TextWidget(
                              text: data.docs[i]['name'],
                              fontSize: 12,
                              fontFamily: 'Regular',
                              color: Colors.black,
                            ),
                          ),
                          DataCell(
                            TextWidget(
                              text: DateFormat.yMMMd()
                                  .format(data.docs[i]['dateTime'].toDate()),
                              fontSize: 12,
                              fontFamily: 'Regular',
                              color: Colors.black,
                            ),
                          ),
                          DataCell(
                            StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection(data.docs[i]['id'])
                                    .snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  if (snapshot.hasError) {
                                    print(snapshot.error);
                                    return const Center(child: Text('Error'));
                                  }
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
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
                                  return TextWidget(
                                    text: data.docs.length % 2 == 0
                                        ? 'Available'
                                        : 'Unavailable',
                                    fontSize: 12,
                                    fontFamily: 'Regular',
                                    color: Colors.black,
                                  );
                                }),
                          ),
                        ])
                    ]);
                  })
            ],
          ),
        ),
      ),
    );
  }

  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  addData(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Equipment'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Action Dropdown (Borrow/Return)
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Tool Name',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),

              // ID Number TextField
              TextField(
                controller: idController,
                decoration: InputDecoration(
                  labelText: 'Tool ID',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
            ],
          ),
          actions: [
            // Save Button
            ElevatedButton(
              onPressed: () {
                addTools(nameController.text, idController.text);

                nameController.clear();
                idController.clear(); // Save logic here
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
