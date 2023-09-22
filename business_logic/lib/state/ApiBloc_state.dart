import 'package:equatable/equatable.dart';

abstract class ApiBlocState extends Equatable {
  @override
  String toString() {
    return super.toString();
  }
}

class ApiUninitializedState extends ApiBlocState {
  @override
  List<Object> get props => [];

  get list => null;
}

class ServerNotRespondingState extends ApiBlocState {
  @override
  List<Object> get props => [];
}

class UserBlocState extends ApiBlocState {
  @override
  List<Object> get props => [];
}



