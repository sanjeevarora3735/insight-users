import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:insight_users/model/users_info.dart';
import 'package:meta/meta.dart';

import '../../../api/client/rest_client.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final GetIt _locator = GetIt.instance;
  List<User> users = [];
  HomePageBloc() : super(HomePageInitial()) {
    on<LoadUsersInfo>(doLoadUsersInfo);
    on<FilterUsersInfo>(doFilterUsersInfo);
    on<Dial>(doDial);
  }

  Future<FutureOr<void>> doLoadUsersInfo(LoadUsersInfo event, Emitter<HomePageState> emit) async {
    try {
      final response =  await _locator.get<RestClient>().getUsersInfo();
      users = response;
      emit(HomePageRenderUsers(users: response));
      emit(HomePageUsersUpdated());
    } catch (e) {
      emit(HomePageError(message: e.toString()));
    }
  }

  FutureOr<void> doFilterUsersInfo(FilterUsersInfo event, Emitter<HomePageState> emit) {

    try {
    final filteredUsers = users.where((user) {
      return user.name.toLowerCase().contains(event.search_key.toLowerCase());
    }).toList();

    if (filteredUsers.isNotEmpty) {
      emit(HomePageRenderUsers(users: filteredUsers));
    } else {
      emit(HomePageError(message: "No Users Found"));
    }
  } catch (e) {
    emit(HomePageError(message: e.toString()));
  }

  }

  FutureOr<void> doDial(Dial event, Emitter<HomePageState> emit) {
    emit(HomePageDial(dialString: event.dialString));
  }
}
