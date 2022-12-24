import 'package:flutter/material.dart';
import 'package:graduation_project/app/my_app.dart';
import 'package:graduation_project/data/data_provider/local/my_cache.dart';
import 'package:graduation_project/data/data_provider/local/my_cache_keys.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyCache.init();
  // String? token = await MyCache.getString(key: MyCacheKeys.token);
  String? token = MyCache.getString(key: MyCacheKeys.token);
  runApp(FamilyFoods(token: token));
}
