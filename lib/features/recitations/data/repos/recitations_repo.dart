import 'package:dartz/dartz.dart';
import 'package:islami_app/features/recitations/data/models/surah_audio/surah_audio.dart';

import '../../../../core/errors/failures.dart';
import '../models/recitation/recitation.dart';

abstract class RecitationsRepo {
  Future<Either<Failure, List<Recitation>>> getRecitations();

  Future<Either<Failure, SurahAudio>> fetchSurahAudio(
      {required String reciterId, required String chapterId});
}
