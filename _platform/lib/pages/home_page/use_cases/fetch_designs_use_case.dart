import 'package:one_thousand_and_one_designs/data_sources/api_data_source.dart';
import 'package:one_thousand_and_one_designs/data_sources/models/api_models.dart';
import 'package:one_thousand_and_one_designs/app/use_case.dart';

class FetchDesignsUseCase {
  final APIDataSource _apiDataSource;

  FetchDesignsUseCase(this._apiDataSource);

  Future<UseCase<List<DesignModel>>> call() => useCase(
        () async {
          return _apiDataSource.fetchDesigns();
        },
      );
}
