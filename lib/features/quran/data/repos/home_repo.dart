import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/ayat/ayat.dart';
import '../models/quran/quran.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Quran>>> fetchQuranDetails();
  Future<Either<Failure, Surah>> fetchSurahDetails({required String id});
}
