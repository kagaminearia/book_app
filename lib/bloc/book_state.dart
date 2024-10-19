import 'package:equatable/equatable.dart';
import 'package:hw3/model/book.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class BookLoading extends BookState {}

class BooksSortedByAuthor extends BookState {
  final List<Book> books;

  const BooksSortedByAuthor(this.books);

  @override
  List<Object> get props => [books];
}

class BooksSortedByTitle extends BookState {
  final List<Book> books;

  const BooksSortedByTitle(this.books);

  @override
  List<Object> get props => [books];
}