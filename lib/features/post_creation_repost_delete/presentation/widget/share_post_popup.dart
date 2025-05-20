import 'package:flutter/material.dart';

void showPeopleBottomSheet(BuildContext context) {
  final people = ['Alice','Alice','Alice','Alice','Alice','Alice', 'Bob', 'Charlie', 'Diana', 'Eve', 'Frank', 'Grace'];

  showModalBottomSheet(

    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
    ),
    builder: (context) {
      return Container(
padding: EdgeInsets.only(top: 15,left: 15),
        decoration: BoxDecoration(
          color: Colors.white,
            borderRadius: BorderRadius.circular(20), // Rounded corners
        ),
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select a Person',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: people.length,
                separatorBuilder: (_, __) => SizedBox(width: 20),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.person, size: 24),
                      SizedBox(height: 6),
                      Text(
                        people[index],
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}