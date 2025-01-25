import 'package:dio/dio.dart';
import 'package:one_thousand_and_one_designs/app/exceptions.dart';
import 'package:one_thousand_and_one_designs/data_sources/api_data_source.dart';
import 'package:one_thousand_and_one_designs/data_sources/models/api_models.dart';
import 'package:one_thousand_and_one_designs/data_sources/repositories/api_repository.dart';
import 'package:one_thousand_and_one_designs/main.dart';

class ApiSource implements APIDataSource {
  ApiSource(AppConfig config) : _repo = APIRepository(config);

  final APIRepository _repo;

  @override
  Future<List<DesignModel>> fetchDesigns() {
    try {
      return _repo.fetchDesigns();
    } on DioException catch (ex) {
      throw AppAPIException(ex.message ?? '', ex.response?.statusCode ?? 500);
    }
  }
}
