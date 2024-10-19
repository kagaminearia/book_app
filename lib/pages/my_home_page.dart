import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hw3/bloc/book_bloc.dart';
import 'package:hw3/bloc/book_event.dart';
import 'package:hw3/bloc/book_state.dart';
import 'package:hw3/model/book.dart';
import 'package:hw3/widgets/booklistview.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the title
          children: [
            Text("Book Club Home", style: TextStyle(fontSize: 25)), // Title text
          ],
        ),),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 16),
              const Text(
              "Sort by",
              style: TextStyle(fontSize: 17),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<BookBloc>(context).add(SortByAuthor());
                },
                child: BlocBuilder<BookBloc, BookState>(
                  builder: (context, state) {
                    final isSelected = BlocProvider.of<BookBloc>(context).sortType == SortType.author;
                    return Text(
                      'Author',
                      style: TextStyle(
                        color: isSelected ? const Color.fromARGB(255, 67, 54, 244) : Colors.black,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<BookBloc>(context).add(SortByTitle());
                },
                child: BlocBuilder<BookBloc, BookState>(
                  builder: (context, state) {
                    final isSelected = BlocProvider.of<BookBloc>(context).sortType == SortType.title;
                    return Text(
                      'Title',
                      style: TextStyle(
                        color: isSelected ? const Color.fromARGB(255, 67, 54, 244) : Colors.black,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 16),
              Text(
            "Books",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          // Text(
          //   "Books",
          //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            
          // ),
          const SizedBox(height: 20),
          Expanded(
            child: BlocBuilder<BookBloc, BookState>(
              builder: (context, state) {
                if (state is BookLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                List<Book> books = [];
                if (state is BooksSortedByAuthor) {
                  books = (state).books;
                } else if (state is BooksSortedByTitle) {
                  books = (state).books;
                }
                return BookListView(books: books);
              },
            ),
          ),
        ],
      ),
    );
  }
}