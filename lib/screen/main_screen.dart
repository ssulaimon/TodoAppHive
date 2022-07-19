import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/alert/alertDialogue.dart';
import 'package:todo/models/hive_calss.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late TextEditingController _tittle;
  late TextEditingController _describtion;
  int? lenght;

  @override
  void initState() {
    // TODO: implement initState

    _tittle = TextEditingController();
    _describtion = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tittle.dispose();
    _describtion.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My todo App'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, index) {
          Map? stored = DataBase().getData(index: index);
          return ListTile(
            leading: Text(stored?['title']),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    DataBase().deleteData(index: index);
                  });
                },
                icon: const Icon(
                  Icons.delete,
                )),
            title: Text(stored?['describtion']),
          );
        },
        itemCount: lenght = DataBase().boxLenght() ?? 1,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await dialogueShow(
              context: context, title: _tittle, describtion: _describtion);
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
