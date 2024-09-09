import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/features/recitations/presentation/manager/recitation_cubit/recitation_state.dart';
import 'package:islami_app/features/recitations/presentation/views/widgets/recitation_item.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../manager/recitation_cubit/recitation_cubit.dart';

class RecitationsListView extends StatelessWidget {
  RecitationsListView({super.key});
  final List<String> images = [
    AppAssets.mohamedElminshay,
    AppAssets.abedElbased,
    AppAssets.abedElbased,
    AppAssets.aboBaker,
    AppAssets.hany,
    AppAssets.elahasry,
    AppAssets.elahasry,
    AppAssets.rashed,
    AppAssets.saoud,
    AppAssets.mohamedEltablay,
    AppAssets.abedElrahman,
    AppAssets.mohamedElminshay,
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecitationCubit, RecitationState>(
        builder: (context, state) {
      if (state is RecitationSuccess) {
        return ListView.builder(
          itemBuilder: (context, index) {
            state.recitations[index].image = images[index];
            return RecitationsItem(
              recitation: state.recitations[index],
            );
          },
          itemCount: state.recitations.length,
        );
      } else if (state is RecitationFailure) {
        return CustomErrorWidget(error: state.errMessage);
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
