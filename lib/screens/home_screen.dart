import 'package:algecit/utils/colors.dart';
import 'package:algecit/widgets/drawer_widget.dart';
import 'package:algecit/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Card(
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
                                text: '787',
                                fontSize: 75,
                                fontFamily: 'Bold',
                                color: Colors.black,
                              ),
                              TextWidget(
                                text: 'Numbers of students with records',
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
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      elevation: 3,
                      color: Colors.white,
                      child: SizedBox(
                        height: 130,
                        width: 165,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWidget(
                              text: '105',
                              fontSize: 60,
                              fontFamily: 'Bold',
                              color: Colors.black,
                            ),
                            TextWidget(
                              text: 'Number of Tools',
                              fontSize: 11,
                              fontFamily: 'Regular',
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 3,
                      color: Colors.white,
                      child: SizedBox(
                        height: 130,
                        width: 165,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWidget(
                              text: '69',
                              fontSize: 60,
                              fontFamily: 'Bold',
                              color: Colors.black,
                            ),
                            TextWidget(
                              text: 'Tools borrowed',
                              fontSize: 11,
                              fontFamily: 'Regular',
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                DataTable(border: TableBorder.all(), columns: [
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
                  for (int i = 0; i < 10; i++)
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
                          text: 'Data',
                          fontSize: 12,
                          fontFamily: 'Regular',
                          color: Colors.black,
                        ),
                      ),
                      DataCell(
                        TextWidget(
                          text: 'January 01, 2001',
                          fontSize: 12,
                          fontFamily: 'Regular',
                          color: Colors.black,
                        ),
                      ),
                      DataCell(
                        TextWidget(
                          text: 'Available',
                          fontSize: 12,
                          fontFamily: 'Regular',
                          color: Colors.black,
                        ),
                      ),
                    ])
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
