import 'package:hive_flutter/adapters.dart';
import 'package:subzero_mobile/features/auth/data/models/user_model.dart';

class HiveService {
  final String _userBox = "userBox";
  late UserModel? user;
  static final HiveService instance = HiveService._internal();
  HiveService._internal();

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserModelAdapter());
    await Hive.openBox<UserModel>(_userBox);
    user = _getUser();
  }

  UserModel? _getUser() {
    var box = Hive.box<UserModel>(_userBox);
    if (box.isEmpty) return null;
    return box.values.first;
  }

  Future storeUser(UserModel user) async {
    var box = Hive.box<UserModel>(_userBox);
    if (box.isNotEmpty) await box.clear();
    await box.add(user);
    user = box.values.first;
  }
}
