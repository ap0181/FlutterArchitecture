import 'package:bloc/bloc.dart';
import 'package:business_logic/event/GetCountriesDataEvent.dart';
import 'package:business_logic/services/repositories/ApiBloc_repository.dart';
import 'package:business_logic/state/GetCountriesDataState.dart';


class GetCountriesDataBloc extends Bloc<GetCountriesDataEvent, GetCountriesDataState> {
  final ApiBlocRepository? playerRepository;

  GetCountriesDataBloc(this.playerRepository)
      : assert(playerRepository != null),
        super(ApiUninitializedState());

  @override
  void onTransition(Transition<GetCountriesDataEvent, GetCountriesDataState> transition) {
    super.onTransition(transition);
  }

  void dispose() {
  }

  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  GetCountriesDataState get initialState => ApiUninitializedState();

  @override
  Stream<GetCountriesDataState> mapEventToState(
      GetCountriesDataEvent? event,
      ) async* {
    if (event is GetCountriesEvent) {
      yield* event.applyAsync(
          playerRepository: playerRepository, currentState: state, bloc: this);
    }
  }
}

