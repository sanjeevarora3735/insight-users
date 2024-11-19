import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insight_users/pages/home/bloc/home_page_bloc.dart';

class SearchBox extends StatelessWidget {
  final HomePageBloc homePageBloc;

  const SearchBox({super.key, required this.homePageBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 15,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        onChanged: (value) => homePageBloc.add(FilterUsersInfo(search_key: value.trim())),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person_search, color: Colors.blue),
          hintText: 'Search',
          hintStyle: GoogleFonts.poppins(color: Colors.grey),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}
