import 'package:algecit/utils/colors.dart';
import 'package:algecit/widgets/drawer_widget.dart';
import 'package:algecit/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class EquipmentsTab extends StatefulWidget {
  const EquipmentsTab({super.key});

  @override
  State<EquipmentsTab> createState() => _EquipmentsTabState();
}

class _EquipmentsTabState extends State<EquipmentsTab> {
  String? selectedValue;
  final TextEditingController _searchController = TextEditingController();
  final List<String> dropdownItems = ['Available', 'Unavailable'];
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
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search Tool..',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10), // Spacing

                  // Dropdown Button
                  DropdownButton<String>(
                    value: selectedValue,
                    hint: Text('Select Status'),
                    items: dropdownItems.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue;
                      });
                    },
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
