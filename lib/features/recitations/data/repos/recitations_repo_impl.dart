import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islami_app/core/errors/failures.dart';
import 'package:islami_app/core/utils/api_services.dart';
import 'package:islami_app/features/recitations/data/models/recitation/recitation.dart';
import 'package:islami_app/features/recitations/data/models/surah_audio/surah_audio.dart';
import 'package:islami_app/features/recitations/data/repos/recitations_repo.dart';

class RecitationsRepoImpl implements RecitationsRepo {
  final ApiServices apiServices;

  RecitationsRepoImpl(this.apiServices);

  @override
  Future<Either<Failure, List<Recitation>>> getRecitations() async {
    try {
      Map<String, dynamic> data = await apiServices.getAllRecitations();

      List<Recitation> recitations = [];

      for (var recitation in data['recitations']) {
        recitations.add(Recitation.fromJson(recitation));
      }

      return Right(recitations);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, SurahAudio>> fetchSurahAudio(
      {required String reciterId, required String chapterId}) async {
    try {
      final data = await apiServices.getSurahAudio(reciterId, chapterId);

      return Right(SurahAudio.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
