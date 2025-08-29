import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppConfig {
  AppConfig._({required this.appName, required this.apiBaseUrl});

  final String appName;
  final String apiBaseUrl;

  factory AppConfig.fromJson(Map<String, dynamic> json) {
    return AppConfig._(appName: json['appName'], apiBaseUrl: json['apiBaseUrl']);
  }

  static Future<AppConfig> load() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final env = packageInfo.packageName.split('.').last.toLowerCase();

    final jsonString = await rootBundle.loadString('assets/config/$env.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    return AppConfig.fromJson(jsonMap);
  }
}
