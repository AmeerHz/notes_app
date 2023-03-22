import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notes_app/views/widgets/edit_note_view_body.dart';

import '../cubits/language/language_cubit.dart';
import '../models/note_model.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LanguageCubit, LanguageState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Directionality(
          textDirection: BlocProvider.of<LanguageCubit>(context).isEn
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: Scaffold(
            body: EditNoteViewBody(
              note: note,
            ),
          ),
        );
      },
    );
  }
}
