import 'package:hive_flutter/adapters.dart';

class DataBase {
// add data to the HiveBox
  String? addTask({
    required String description,
  }) {
    try {
      var box = Hive.box(
        'mytodo',
      );
      if (description == '') {
        return 'error';
      } else {
        box.add({
          'description': description,
        });
        return 'Task added';
      }
    } catch (e) {
      return e.toString();
    }
  }
  //Get lenght of item in the Box

  int? boxLenght() {
    try {
      var value = Hive.box('mytodo');
      return value.length;
    } catch (e) {
      return null;
    }
  }

  //Get item in a particular index
  Map? getData({required int index}) {
    try {
      var value = Hive.box('mytodo');
      return value.getAt(index);
    } catch (e) {
      return null;
    }
  }

// Delete item at a particular index
  String? deleteData({required int index}) {
    try {
      var deleteData = Hive.box('mytodo');
      deleteData.deleteAt(index);
      return 'deleted';
    } catch (e) {
      return null;
    }
  }
}
