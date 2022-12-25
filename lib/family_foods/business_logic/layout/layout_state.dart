// ignore_for_file: must_be_immutable

part of 'layout_cubit.dart';

@immutable
abstract class LayoutState {}

class LayoutInitialState extends LayoutState {}

class LayoutSuccessState extends LayoutState {}
