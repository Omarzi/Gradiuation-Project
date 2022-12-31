// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:graduation_project/data/data_provider/local/my_cache_keys.dart';
import 'package:graduation_project/family_foods/business_logic/bloc_observer/bloc_observer.dart';
import 'app/my_app.dart';
import 'package:bloc/bloc.dart';
import 'data/data_provider/local/my_cache.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await MyCache.init();
  print(MyCache.getString(key: MyCacheKeys.myId));
  runApp(const FamilyFoods());
}
