import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/features/recitations/presentation/manager/recitation_cubit/recitation_state.dart';

import '../../../data/repos/recitations_repo.dart';

class RecitationCubit extends Cubit<RecitationState> {
  RecitationCubit(this._recitationRepo) : super(RecitationInitial());
  final RecitationsRepo _recitationRepo;

  Future<void> getRecitations() async {
    emit(RecitationLoading());

    final result = await _recitationRepo.getRecitations();
    result.fold(
      (failure) => emit(RecitationFailure(failure.errMessage)),
      (recitations) => emit(RecitationSuccess(recitations)),
    );
  }
}
