import 'package:either_dart/either.dart';
import 'package:one_thousand_and_one_designs/app/exceptions.dart';

typedef UseCase<T> = Either<AppException, T>;

typedef UseCaseSuccess<T> = Right<AppException, T>;

typedef UseCaseFailure<T> = Left<AppException, T>;

extension UseCaseExt<T> on UseCase<T> {
  AppException get exception => left;

  bool get success => isRight;
}

Future<UseCase<T>> useCase<T>(Future<T> Function() request) async {
  try {
    final result = await request();
    return UseCaseSuccess(result);
  } on AppException catch (ex) {
    return UseCaseFailure(ex);
  } on Exception catch (ex, st) {
    return UseCaseFailure(AppUnexpectedException(ex.toString(), st));
  }
}

UseCase<T> useCaseSync<T>(T Function() request) {
  try {
    final result = request();
    return UseCaseSuccess(result);
  } on AppException catch (ex) {
    return UseCaseFailure(ex);
  } on Exception catch (ex, st) {
    return UseCaseFailure(AppUnexpectedException(ex.toString(), st));
  }
}
