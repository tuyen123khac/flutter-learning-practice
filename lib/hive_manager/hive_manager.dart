import 'package:flutter_learning_practice/models/person_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveManager {
  static const String boxName = 'personBox';
  static bool _isInitialized = false;
  HiveManager._();
  static Future<void> initHive() async {
    if (!_isInitialized) {
      final appDocumentDir =
          await path_provider.getApplicationDocumentsDirectory();
      Hive.init(appDocumentDir.path);
      Hive.registerAdapter(PersonModelAdapter());

      await Hive.openBox<PersonModel>(boxName);

      _isInitialized = true;
    }
  }

  static Box<PersonModel> get myModelBox {
    return Hive.box<PersonModel>(boxName);
  }

  static Future<void> addMyModel(PersonModel model) async {
    final box = myModelBox;
    await box.add(model);
  }

  static Future<void> updateMyModel(int index, PersonModel updatedModel) async {
    final box = myModelBox;
    await box.putAt(index, updatedModel);
  }

  static Future<void> deleteMyModel(int index) async {
    final box = myModelBox;
    await box.deleteAt(index);
  }

  static List<PersonModel> getAllMyModels() {
    final box = myModelBox;
    return box.values.toList();
  }

  static Future<void> closeHive() async {
    await Hive.close();
    _isInitialized = false;
  }
}
