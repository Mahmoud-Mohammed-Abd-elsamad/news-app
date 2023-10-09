part of 'search_screen_cubit.dart';

@immutable
abstract class SearchScreenState {}

class SearchScreenInitial extends SearchScreenState {}
class SearchScreenShowLoading extends SearchScreenState {}
class SearchScreenSuccess extends SearchScreenState {}
class SearchScreenFailure extends SearchScreenState {
  final String errorMessage;
  SearchScreenFailure(this.errorMessage);
}
