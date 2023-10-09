part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeSowLoading extends HomeState {}

class HomeGetSourcesSuccess extends HomeState {}

class HomeGetSourcesFailure extends HomeState {

 final String errorMessage;
  HomeGetSourcesFailure(this.errorMessage);
}

class HomeSuccessGetNewsBySource extends HomeState {}

class HomeFailureGetNewsBySource extends HomeState {
 final  String errorMessage;
  HomeFailureGetNewsBySource(this.errorMessage);
}
