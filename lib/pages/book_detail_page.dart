import 'package:flutter/material.dart';
import 'package:hw3/model/book.dart';
import 'package:hw3/widgets/bookinfoview.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  const BookDetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the title
          children: [
            Text("Book Detail", style: TextStyle(fontSize: 25)), 
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Return to home page
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(  
        child: BookInfoView(book: book), 
      ),
    );
  }
}
