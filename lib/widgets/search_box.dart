import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:itbook_store/bloc/book_cubit.dart';

import '../resources/consts.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final _searchController = TextEditingController();
  late final BookCubit cubit;
  bool searched = false;

  @override
  void initState() {
    super.initState();
    cubit = context.read<BookCubit>();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search by title, author or keywords",
                  hintStyle: GoogleFonts.nunito(
                    color: AppColor.textColor.withOpacity(0.5),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  border: InputBorder.none,
                ),
                style: GoogleFonts.nunito(
                  color: AppColor.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                if (!searched) {
                  final query = _searchController.text;
                  cubit.searchBook(query);
                } else {
                  _searchController.clear();
                  cubit.fetchNewBook();
                }
                setState(() {
                  searched = !searched;
                });
              },
              icon: Icon(
                searched ? Icons.cancel : Icons.search_outlined,
                color: AppColor.textColor,
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
