import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';

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
        backgroundColor: Colors.yellow,
        elevation: 0.0,
        title: const Text(
          'My todo App',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(
                Icons.replay_outlined,
                color: Colors.black,
              ))
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, index) {
              Map? stored = DataBase().getData(index: index);
              return Card(
                margin: const EdgeInsets.all(7.0),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      Text(
                        stored?['description'],
                        style: const TextStyle(fontSize: 19.0),
                      ),
                      Center(
                        child: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              String? taskResult =
                                  DataBase().deleteData(index: index);
                              log(taskResult!);
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: lenght = DataBase().boxLenght() ?? 1,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    flex: 2,
                    child: TextField(
                      controller: _describtion,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Colors.white,
                          focusColor: Colors.white,
                          hoverColor: Colors.white),
                    )),
                Expanded(
                  flex: 1,
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    onPressed: () {
                      setState(() {
                        String? taskResult =
                            DataBase().addTask(description: _describtion.text);

                        log(taskResult!);
                      });
                    },
                    color: Colors.yellow,
                    child: const Text('Add'),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      backgroundColor: Colors.purple[400],
    );
  }
}
