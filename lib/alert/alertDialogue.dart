import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo/models/hive_calss.dart';

dialogueShow({
  required BuildContext context,
  required TextEditingController title,
  required TextEditingController describtion,
}) async {
  showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Add task'),
          actions: [
            TextField(
              controller: title,
              decoration: const InputDecoration(hintText: 'Title'),
            ),
            TextField(
              controller: describtion,
              decoration: const InputDecoration(
                hintText: 'Description \n here ',
              ),
            ),
            Center(
              child: TextButton(
                  onPressed: () async {
                    String? data = DataBase().addTask(
                        title: title.text, description: describtion.text);
                    switch (data) {
                      case 'mytodo':
                        log('your task added');
                        Navigator.pop(context);
                        break;
                      default:
                        log(data.toString());
                        Navigator.pop(context);
                        break;
                    }
                  },
                  child: const Text('Add task')),
            )
          ],
        );
      });
}
