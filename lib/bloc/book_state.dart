import 'package:equatable/equatable.dart';

import '../models/book.dart';

class BookState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitBookState extends BookState {}

class LoadingBookState extends BookState {}

class ResponseBookState extends BookState {
  final List<Book> books;
  ResponseBookState(this.books);

  @override
  List<Object?> get props => [books];
}

class ErrorBookState extends BookState {
  final String error;
  ErrorBookState(this.error);

  @override
  List<Object?> get props => [error];
}
