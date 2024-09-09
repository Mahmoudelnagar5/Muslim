import 'package:dartz/dartz.dart';
import 'package:islami_app/core/errors/failures.dart';

abstract class PrayerRepo {
  Future<Either<Failure, dynamic>> getPrayerTime();
}
