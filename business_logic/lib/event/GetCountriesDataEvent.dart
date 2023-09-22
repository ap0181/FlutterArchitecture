import 'package:business_logic/blocs/GetCountriesDataBloc.dart';
import 'package:business_logic/services/repositories/ApiBloc_repository.dart';
import 'package:business_logic/services/repositories/AppExceptions.dart';
import 'package:business_logic/state/GetCountriesDataState.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class GetCountriesDataEvent extends Equatable {}

class GetCountriesEvent extends GetCountriesDataEvent {

  GetCountriesEvent();

  @override
  List<Object> get props => [];

  Stream<GetCountriesDataState> applyAsync(
      {ApiBlocRepository? playerRepository,
      GetCountriesDataState? currentState,
      GetCountriesDataBloc? bloc}) async* {
    yield const GetCountriesApiFetchingState(message: "Checking your details...");
    try {
      final response = await playerRepository!.GetCountries();
      yield GetAllCountryDataState(response);
    } on ApiFailedException catch (e) {
      yield GetCountriesErrorState(e.errorResponse);
    } on NoInternetException catch (_) {
      yield GetCountriesNoInternetState();
    } on ServerNotRespondingException catch (_) {
      yield ServerNotRespondingState();
    } on UserBlockException catch (_){
      yield UserBlocState();
    }
  }
}

