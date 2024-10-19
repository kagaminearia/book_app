import 'package:flutter/material.dart';
import 'package:hw3/model/book.dart';
import 'package:hw3/pages/book_detail_page.dart';

class BookListView extends StatelessWidget {
  final List<Book> books;

  const BookListView({required this.books, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,  // Horizontal scrolling
      itemCount: books.length,
      itemBuilder: (context, index) {
        final book = books[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookDetailPage(book: book),
              ),
            );
          },
          child: Container(
            width: 170,  // Width for each book item
            padding: EdgeInsets.all(3.0),
            child: Column(
              children: [
                Image.network(
                  book.imageUrl,
                  height: 200,  // Adjust height as needed
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
