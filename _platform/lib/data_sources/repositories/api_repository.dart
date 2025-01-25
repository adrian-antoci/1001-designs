import 'dart:async';

import 'package:one_thousand_and_one_designs/data_sources/models/api_models.dart';
import 'package:one_thousand_and_one_designs/main.dart';

class APIRepository {
  APIRepository(this.config);

  final AppConfig config;

  Future<List<DesignModel>> fetchDesigns() async {
    await Future.delayed(Duration(seconds: 1));
    return [DesignModel(folder: 'folder', name: 'name')];
  }
}
