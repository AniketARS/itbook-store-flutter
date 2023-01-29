import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itbook_store/resources/consts.dart';
import 'package:itbook_store/widgets/book_card.dart';
import 'package:itbook_store/widgets/search_box.dart';

import '../bloc/book_cubit.dart';
import '../bloc/book_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      final cubit = context.read<BookCubit>();
      cubit.fetchNewBook();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: SafeArea(
        child: Column(
          children: [
            const SearchBox(),
            BlocBuilder<BookCubit, BookState>(
              builder: (context, state) {
                if (state is LoadingBookState || state is InitBookState) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(AppColor.accent),
                      ),
                    ),
                  );
                } else if (state is ResponseBookState) {
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.64,
                        crossAxisCount: 2,
                      ),
                      itemCount: state.books.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return BookCard(
                          imgUrl: state.books[index].imageUrl,
                          title: state.books[index].title,
                          price: state.books[index].price,
                        );
                      },
                    ),
                  );
                } else {
                  return Center(child: Text((state as ErrorBookState).error));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
