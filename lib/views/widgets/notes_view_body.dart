import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/cubits/language/language_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_app_bar_icon.dart';

import 'package:notes_app/views/widgets/notes_list_view.dart';

import '../search_delegate_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var lan = BlocProvider.of<LanguageCubit>(context);
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Directionality(
                textDirection: lan.isEn ? TextDirection.ltr : TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomAppBar(
                            title: lan.getTexts('bar_name'),
                            icon: Icons.search,
                            icon2: Icons.no_cell,
                            onPressed: () {
                              showSearch(
                                context: context,
                                delegate: SearchDelegateView(
                                    hintText: lan.getTexts('bar_s')),
                              );
                            }),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      CustomAppBarIcon(
                        icon:
                            lan.isEn ? FontAwesomeIcons.e : FontAwesomeIcons.a,
                        onPressed:(){lan.changeLan();},
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(
                child: NotesListView(),
              ),
            ],
          ),
        );
      },
    );
  }
}
