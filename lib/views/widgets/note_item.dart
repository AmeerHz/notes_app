import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

import '../../constants.dart';
import '../../cubits/language/language_cubit.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    var lan = BlocProvider.of<LanguageCubit>(context);
    return BlocBuilder<LanguageCubit, LanguageState>(

      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return EditNoteView(
                note: note,
              );
            }));
            BlocProvider.of<NotesCubit>(context).isEdit = true;
          },
          child: Directionality(
            textDirection: lan.isEn ? TextDirection.ltr : TextDirection.rtl,
            child: Container(
              padding: const EdgeInsets.only(
                top: 24,
                bottom: 24,
                left: 24,
                right: 16,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(note.color),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ListTile(
                    title: Text(
                      note.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        note.subtitle,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 19,
                        ),
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        FontAwesomeIcons.trash,
                        color: Colors.black,
                        size: 23,
                      ),
                      onPressed: () {
                        note.delete();
                        BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                        showSnackBar(context, lan.getTexts('show_d'));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Text(
                      note.date,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
