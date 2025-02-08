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
        backgroundColor: Colors.blue,
        title: TextWidget(
          text: 'Dashboard',
          fontSize: 18,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
    );
  }
}
