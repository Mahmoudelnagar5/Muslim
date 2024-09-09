import 'package:equatable/equatable.dart';

import '../../../data/models/recitation/recitation.dart';

sealed class RecitationState extends Equatable {
  const RecitationState();

  @override
  List<Object> get props => [];
}

final class RecitationInitial extends RecitationState {}

final class RecitationLoading extends RecitationState {}

final class RecitationSuccess extends RecitationState {
  final List<Recitation> recitations;

  const RecitationSuccess(this.recitations);
}

final class RecitationFailure extends RecitationState {
  final String errMessage;

  const RecitationFailure(this.errMessage);
}
