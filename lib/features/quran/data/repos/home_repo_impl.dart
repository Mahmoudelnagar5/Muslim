import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islami_app/features/quran/data/models/quran/quran.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/api_services.dart';
import '../models/ayat/ayat.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, List<Quran>>> fetchQuranDetails() async {
    try {
      Map<String, dynamic> jsonData = await apiServices.get();
      List<Quran> surahDetails = [];

      for (var item in jsonData['data']) {
        surahDetails.add(Quran.fromJson(item));
        // print(item);
      }

      return Right(surahDetails);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, Surah>> fetchSurahDetails({required String id}) async {
    try {
      Map<String, dynamic> jsonData = await apiServices.getAyat(id);
      return Right(Surah.fromJson(jsonData));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
