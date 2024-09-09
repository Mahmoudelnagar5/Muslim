import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islami_app/core/errors/failures.dart';
import 'package:islami_app/core/utils/api_services.dart';
import 'package:islami_app/features/prayer/data/models/prayer/prayer.dart';
import 'package:islami_app/features/prayer/data/repos/prayer_repo.dart';

class PrayerRepoImpl implements PrayerRepo {
  final ApiServices apiServices;

  PrayerRepoImpl(this.apiServices);
  @override
  Future<Either<Failure, Prayer>> getPrayerTime() async {
    try {
      Map<String, dynamic> jsonData = await apiServices.getPrayer();
      return Right(Prayer.fromJson(jsonData));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
