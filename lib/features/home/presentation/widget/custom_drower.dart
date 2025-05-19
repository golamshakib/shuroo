import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrower extends StatelessWidget {
  const CustomDrower({super.key});

  @override
  Widget build(BuildContext context) {
    return   Drawer(
    child: Container(
    color: Colors.blueGrey,
    child: ListView(
    padding: EdgeInsets.zero,
    children: [
    DrawerHeader(
    decoration: BoxDecoration(color: Colors.teal),
    child: Text('Header', style: TextStyle(color: Colors.white)),
    ),
    ListTile(
    leading: Icon(Icons.home, color: Colors.white),
    title: Text('Home', style: TextStyle(color: Colors.white)),
    onTap: () {
    Navigator.pop(context);
    },
    ),
    // Add more items here
    ],
    ),
    ),
    );
  }
}
