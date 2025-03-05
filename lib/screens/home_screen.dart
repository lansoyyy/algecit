import 'package:algecit/utils/colors.dart';
import 'package:algecit/widgets/drawer_widget.dart';
import 'package:algecit/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     addData(context);
      //   },
      //   backgroundColor: primary,
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      // ),
      drawer: DrawerWidget(),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: primary,
        title: TextWidget(
          text: 'Dashboard',
          fontSize: 18,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('Students')
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
                      return Card(
                        color: Colors.white,
                        elevation: 3,
                        child: SizedBox(
                          width: double.infinity,
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  minRadius: 50,
                                  maxRadius: 50,
                                  child: Icon(
                                    Icons.groups_3_outlined,
                                    color: Colors.white,
                                    size: 60,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      text: data.docs.length.toString(),
                                      fontSize: 75,
                                      fontFamily: 'Bold',
                                      color: Colors.black,
                                    ),
                                    TextWidget(
                                      text: 'Numbers of students',
                                      fontSize: 11,
                                      fontFamily: 'Regular',
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                SizedBox(
                  height: 20,
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('Tools')
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
                      return Card(
                        color: Colors.white,
                        elevation: 3,
                        child: SizedBox(
                          width: double.infinity,
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  minRadius: 50,
                                  maxRadius: 50,
                                  child: Icon(
                                    Icons.construction_outlined,
                                    color: Colors.white,
                                    size: 60,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      text: data.docs.length.toString(),
                                      fontSize: 75,
                                      fontFamily: 'Bold',
                                      color: Colors.black,
                                    ),
                                    TextWidget(
                                      text: 'Numbers of Tools',
                                      fontSize: 11,
                                      fontFamily: 'Regular',
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                SizedBox(
                  height: 20,
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('Tools')
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
                              text: 'Status',
                              fontSize: 14,
                              fontFamily: 'Bold',
                              color: Colors.black,
                            ),
                          ),
                          DataColumn(
                            label: TextWidget(
                              text: 'Student',
                              fontSize: 14,
                              fontFamily: 'Bold',
                              color: Colors.black,
                            ),
                          ),
                          DataColumn(
                            label: TextWidget(
                              text: 'Date and Time',
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
                                StreamBuilder<QuerySnapshot>(
                                    stream: FirebaseFirestore.instance
                                        .collection(data.docs[i]['id'])
                                        .snapshots(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (snapshot.hasError) {
                                        print(snapshot.error);
                                        return const Center(
                                            child: Text('Error'));
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
                              DataCell(
                                StreamBuilder<QuerySnapshot>(
                                    stream: FirebaseFirestore.instance
                                        .collection(data.docs[i]['id'])
                                        .snapshots(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<QuerySnapshot> snapshot) {
                                      if (snapshot.hasError) {
                                        print(snapshot.error);
                                        return const Center(
                                            child: Text('Error'));
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

                                      final toolData = snapshot.requireData;

                                      return toolData.docs.length % 2 == 0
                                          ? TextWidget(
                                              text: 'N/A',
                                              fontSize: 12,
                                              fontFamily: 'Regular',
                                              color: Colors.black,
                                            )
                                          : StreamBuilder<DocumentSnapshot>(
                                              stream: FirebaseFirestore.instance
                                                  .collection('Students')
                                                  .doc(toolData
                                                      .docs.last['StudentID'])
                                                  .snapshots(),
                                              builder: (context,
                                                  AsyncSnapshot<
                                                          DocumentSnapshot>
                                                      snapshot) {
                                                if (!snapshot.hasData) {
                                                  return const Drawer();
                                                } else if (snapshot.hasError) {
                                                  return const Center(
                                                      child: Text(
                                                          'Something went wrong'));
                                                } else if (snapshot
                                                        .connectionState ==
                                                    ConnectionState.waiting) {
                                                  return const Drawer();
                                                }
                                                dynamic userData =
                                                    snapshot.data;

                                                return TextWidget(
                                                  text: userData['name'],
                                                  fontSize: 12,
                                                  fontFamily: 'Regular',
                                                  color: Colors.black,
                                                );
                                              });
                                    }),
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
                                        return const Center(
                                            child: Text('Error'));
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

                                      final toolData = snapshot.requireData;

                                      return toolData.docs.length % 2 == 0
                                          ? TextWidget(
                                              text: 'N/A',
                                              fontSize: 12,
                                              fontFamily: 'Regular',
                                              color: Colors.black,
                                            )
                                          : TextWidget(
                                              text: DateFormat(
                                                      "yyyy-MM-dd hh:mm:ss a")
                                                  .format(
                                                DateFormat(
                                                        "dd-MM-yyyy : HH:mm:ss")
                                                    .parse(toolData
                                                        .docs.last['TimeStamp'])
                                                    .toUtc()
                                                    .add(Duration(
                                                        hours:
                                                            8)), // Convert to UTC+8
                                              ),
                                              fontSize: 12,
                                              fontFamily: 'Regular',
                                              color: Colors.black,
                                            );
                                    }),
                              ),
                            ])
                        ]),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? selectedAction;

  String? selectedTool;

  final TextEditingController idController = TextEditingController();

  final List<String> actions = ['Borrow', 'Return'];

  final List<String> tools = ['Hammer', 'Wrench', 'Screwdriver', 'Drill'];

  addData(context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Record'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Action Dropdown (Borrow/Return)
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Type',
                  border: OutlineInputBorder(),
                ),
                value: selectedAction,
                items: actions.map((String action) {
                  return DropdownMenuItem<String>(
                    value: action,
                    child: Text(action),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedAction = value;
                  });
                },
              ),
              SizedBox(height: 20),

              // ID Number TextField
              TextField(
                controller: idController,
                decoration: InputDecoration(
                  labelText: 'Student ID Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),

              // Tools Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Select Tool',
                  border: OutlineInputBorder(),
                ),
                value: selectedTool,
                items: tools.map((String tool) {
                  return DropdownMenuItem<String>(
                    value: tool,
                    child: Text(tool),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedTool = value;
                  });
                },
              ),
            ],
          ),
          actions: [
            // Save Button
            ElevatedButton(
              onPressed: () {
                // Save logic here
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
