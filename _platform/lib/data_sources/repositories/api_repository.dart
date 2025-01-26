import 'dart:async';

import 'package:dio/dio.dart';
import 'package:one_thousand_and_one_designs/app/extensions.dart';
import 'package:one_thousand_and_one_designs/data_sources/models/api_models.dart';
import 'package:one_thousand_and_one_designs/main.dart';

class APIRepository {
  APIRepository(this.config);

  final AppConfig config;

  Future<List<DesignModel>> fetchDesigns() async {
    final response = await Dio().get('${config.apiBaseUrl}/database.dat');
    final listOfFiles = (response.data as String).split("\n");
    return listOfFiles
        .where((item) => item.length > 5)
        .map(
          (item) => DesignModel(
            folder: item,
            name: item.replaceAll('_', " ").capitalize(),
          ),
        )
        .toList();
  }
}
