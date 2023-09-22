import 'package:business_logic/models/response/GetCountriesDataResponse.dart';
import 'package:business_logic/models/response/ErrorResponse.dart';
import 'package:equatable/equatable.dart';

abstract class GetCountriesDataState extends Equatable {
  const GetCountriesDataState();
}

class ApiUninitializedState extends GetCountriesDataState {
  @override
  List<Object> get props => [];

  get list => null;
}

class GetCountriesApiFetchingState extends GetCountriesDataState {
  final String? message;

  const GetCountriesApiFetchingState({this.message});

  @override
  List<Object> get props => [message!];
}

class GetAllCountryDataState extends GetCountriesDataState {
  final GetCountriesDataResponse response;

  GetAllCountryDataState(this.response);

  @override
  List<Object> get props => [response];
}

class GetCountriesErrorState extends GetCountriesDataState {
  final ErrorResponse? CountryErrorResponse;

  GetCountriesErrorState(this.CountryErrorResponse);

  @override
  List<Object> get props => [CountryErrorResponse!];
}

class GetCountriesNoInternetState extends GetCountriesDataState {
  @override
  List<Object> get props => [];
}

class ServerNotRespondingState extends GetCountriesDataState {
  @override
  List<Object> get props => [];
}

class UserBlocState extends GetCountriesDataState {
  @override
  List<Object> get props => [];
}

