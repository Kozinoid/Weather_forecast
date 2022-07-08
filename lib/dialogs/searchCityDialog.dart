import 'package:flutter/material.dart';

Future<String> searchCityDialog(BuildContext context) {
  final controller = TextEditingController();
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Enter city name:'),
          content: TextField(
            controller: controller,
          ),
          actions: [
            TextButton(
              child: Text('Ok'),
              onPressed: (){
                Navigator.of(context).pop(controller.text);
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: (){
                Navigator.of(context).pop('');
              },
            ),
          ],
        );
      });
}
