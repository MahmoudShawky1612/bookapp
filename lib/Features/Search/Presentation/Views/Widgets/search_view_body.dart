import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterprojects/Features/Home/Data/Model/book_model.dart';
import 'package:flutterprojects/Features/Home/Presentation/Manager/search_books_cubit/search_books_cubit.dart' as HomeSearchBooksCubit;
import 'package:flutterprojects/Features/Home/Presentation/Manager/search_books_cubit/search_books_states.dart' as HomeSearchBooksStates;

import '../../../../../Core/Widgets/custom_search_text_field.dart';
import '../../../../Home/Presentation/Views/Widgets/book_list_view_item.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<HomeSearchBooksCubit.SearchBooksCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
            onChanged: (query) {
              searchCubit.searchBooks(query);
            },
          ),
          const SizedBox(height: 40),
          Text(
            "Results",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 25),
          Expanded(
            child: BlocBuilder<HomeSearchBooksCubit.SearchBooksCubit, HomeSearchBooksStates.SearchBooksStates>(
              builder: (context, state) {
                if (state is HomeSearchBooksStates.LoadingSearchBooksState) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is HomeSearchBooksStates.SuccessSearchBooksState) {
                  return SearchListView(books: state.books);
                } else if (state is HomeSearchBooksStates.FailureSearchBooksState) {
                  return Text(state.errorMessage);
                } else   {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SearchListView extends StatelessWidget {
  final List<BookModel> books;

  const SearchListView({Key? key, required this.books}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(bookModel: books[index]),
        );
      },
    );
  }
}
