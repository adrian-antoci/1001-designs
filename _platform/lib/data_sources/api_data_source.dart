import 'models/api_models.dart';

abstract interface class APIDataSource {
  Future<List<DesignModel>> fetchDesigns();
}
