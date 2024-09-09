import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/features/recitations/presentation/views/widgets/recitations_view_body.dart';
import '../../../../core/utils/colors.dart';

import '../manager/recitation_cubit/recitation_cubit.dart';

class RecitationsView extends StatefulWidget {
  const RecitationsView({super.key});

  @override
  State<RecitationsView> createState() => _RecitationsViewState();
}

class _RecitationsViewState extends State<RecitationsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<RecitationCubit>(context).getRecitations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        iconTheme: Theme.of(context).primaryIconTheme,
        title: Text(
          'القراء',
          style: GoogleFonts.amiri(
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.background,
      ),
      body: const RecitationsViewBody(),
    );
  }
}
