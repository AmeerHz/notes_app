import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../cubits/notes_cubit/notes_cubit.dart';
import '../../models/note_model.dart';
import 'note_item.dart';

class SearchResultsBody extends StatelessWidget {
  const SearchResultsBody({Key? key, required this.query}) : super(key: key);
  final String query;

  @override
  Widget build(BuildContext context) {
    List<NoteModel>? notesResult = query.isEmpty
        ? BlocProvider.of<NotesCubit>(context).notes
        : BlocProvider.of<NotesCubit>(context)
            .notes!
            .where((e) =>
                e.title.startsWith(query) || e.subtitle.startsWith(query))
            .toList();
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is NotesSuccess) {
          notesResult = query.isEmpty
              ? BlocProvider.of<NotesCubit>(context).notes
              : BlocProvider.of<NotesCubit>(context)
                  .notes!
                  .where((s) =>
                      s.title.startsWith(query) || s.subtitle.startsWith(query))
                  .toList();
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              Expanded(
                  child: notesResult!.isEmpty
                      ? const Center(
                          child: Text(
                            'No Results',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryColor,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: notesResult!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: NoteItem(note: notesResult![index]),
                            );
                          })),
            ],
          ),
        );
      },
    );
  }
}
