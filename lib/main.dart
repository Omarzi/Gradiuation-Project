import 'package:flutter/material.dart';
import 'app/my_app.dart';
import 'data/data_provider/local/my_cache.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyCache.init();
  runApp(const FamilyFoods());
}
