import 'package:algecit/utils/colors.dart';
import 'package:algecit/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  String id;

  HistoryScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: primary,
        title: TextWidget(
          text: 'Student History',
          fontSize: 18,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('4800361410816')
                    .where('StudentID', isEqualTo: '9789719805434')
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
                            StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('Tools')
                                    .where('id', isEqualTo: '4800361410816')
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

                                  final toolData = snapshot.requireData;
                                  return TextWidget(
                                    text: toolData.docs.first['name'],
                                    fontSize: 12,
                                    fontFamily: 'Regular',
                                    color: Colors.black,
                                  );
                                }),
                          ),
                          DataCell(TextWidget(
                            text: DateFormat("yyyy-MM-dd hh:mm:ss a").format(
                              DateFormat("dd-MM-yyyy : HH:mm:ss")
                                  .parse(data.docs[i]['TimeStamp'])
                                  .add(Duration(hours: 8)), // Convert to UTC+8
                            ),
                            fontSize: 12,
                            fontFamily: 'Regular',
                            color: Colors.black,
                          )),
                        ])
                    ]),
                  );
                })
          ],
        ),
      ),
    );
  }
}
