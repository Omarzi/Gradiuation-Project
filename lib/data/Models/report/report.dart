import 'dart:convert';

ReportModel reportModelFromJson(String str) => ReportModel.fromJson(json.decode(str));

class ReportModel {
    ReportModel({
        required this.message,
    });

    String message;

    factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        message: json["message"],
    );
}