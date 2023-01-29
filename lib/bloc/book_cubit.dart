import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itbook_store/bloc/book_state.dart';
import 'package:itbook_store/repository/book_repository.dart';

class BookCubit extends Cubit<BookState> {
  final BookRepository _repository;
  BookCubit(this._repository) : super(InitBookState());

  Future<void> fetchNewBook() async {
    emit(LoadingBookState());
    try {
      final response = await _repository.getNewBooks();
      emit(ResponseBookState(response));
    } catch (e) {
      emit(ErrorBookState(e.toString()));
    }
  }

  Future<void> searchBook(String query) async {
    emit(LoadingBookState());
    try {
      final response = await _repository.searchBook(query);
      emit(ResponseBookState(response));
    } catch (e) {
      emit(ErrorBookState(e.toString()));
    }
  }
}
