// ignore_for_file: must_be_immutable

part of 'report_cubit.dart';

@immutable
abstract class ReportState {}

class ReportInitial extends ReportState {}

class ReportInitialState extends ReportState {}

class ReportLoadingState extends ReportState {}

class ReportSuccessState extends ReportState {}

class ReportErrorState extends ReportState {
  String error;
  ReportErrorState({required this.error});
}
