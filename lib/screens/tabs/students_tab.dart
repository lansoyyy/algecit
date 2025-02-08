import 'package:algecit/utils/colors.dart';
import 'package:algecit/widgets/drawer_widget.dart';
import 'package:algecit/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class StudentsTab extends StatefulWidget {
  const StudentsTab({super.key});

  @override
  State<StudentsTab> createState() => _StudentsTabState();
}

class _StudentsTabState extends State<StudentsTab> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search Name..',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
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
                    text: '# of Records',
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
                        text: '123456',
                        fontSize: 12,
                        fontFamily: 'Regular',
                        color: Colors.black,
                      ),
                    ),
                    DataCell(
                      TextWidget(
                        text: 'John Doe',
                        fontSize: 12,
                        fontFamily: 'Regular',
                        color: Colors.black,
                      ),
                    ),
                    DataCell(
                      TextWidget(
                        text: '105',
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
    );
  }
}
