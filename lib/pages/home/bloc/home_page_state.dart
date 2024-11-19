part of 'home_page_bloc.dart';

@immutable
sealed class HomePageState {}

final class HomePageInitial extends HomePageState {

}


final class HomePageRenderUsers extends HomePageState {
  final List<User> users;

  HomePageRenderUsers({required this.users});
}


final class HomePageError extends HomePageState{
  final String message;

  HomePageError({required this.message});
}


final class HomePageUsersUpdated extends HomePageState{

  HomePageUsersUpdated();
}

final class HomePageDial extends HomePageState{
  final String dialString;

  HomePageDial({required this.dialString});
}