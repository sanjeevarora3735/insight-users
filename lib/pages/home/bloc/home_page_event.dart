part of 'home_page_bloc.dart';

@immutable
sealed class HomePageEvent {}

class LoadUsersInfo extends HomePageEvent {}

class FilterUsersInfo extends HomePageEvent{
  final String search_key;

  FilterUsersInfo({required this.search_key});
}


class Dial extends HomePageEvent{
  final String dialString;

  Dial({required this.dialString});
}
