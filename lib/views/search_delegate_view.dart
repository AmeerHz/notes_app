import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/search_results_body.dart';

class SearchDelegateView extends SearchDelegate {
   SearchDelegateView({
       required String hintText,
     }) : super(
       searchFieldLabel: hintText,
       keyboardType: TextInputType.text,
       textInputAction: TextInputAction.search,
       
     );
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchResultsBody(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SearchResultsBody(
      query: query,
    );
  }
}
