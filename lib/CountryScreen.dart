
import 'package:business_logic/blocs/GetCountriesDataBloc.dart';
import 'package:business_logic/event/GetCountriesDataEvent.dart';
import 'package:business_logic/models/response/GetCountriesDataResponse.dart';
import 'package:business_logic/state/GetCountriesDataState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterarchitecturedemo/utils/CenterLoadingIndicator.dart';
class CountryScreen extends StatefulWidget {
  CountryScreen();

  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  GetCountriesDataBloc? getCountryBloc;
  GetCountriesDataEvent? countryDataEvent;
  GetCountriesDataResponse? countryResponse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCountryBloc = BlocProvider.of<GetCountriesDataBloc>(context);
    getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocListener<GetCountriesDataBloc, GetCountriesDataState>(
            listener: (context, state) {
              if (state is GetAllCountryDataState) {
                debugPrint(
                    "we are getting country @36 :: ${state.response.toString()}");
                setState(() {
                  if (state.response.success == true) {
                  }
                  countryResponse = state.response;
                });
              } else if (state is GetCountriesErrorState) {
                showSnackBar(state.CountryErrorResponse!.title!);
              } else if (state is GetCountriesNoInternetState) {
              } else if (state is ServerNotRespondingState) {
              } else if (state is UserBlocState) {
              }
            },
            child: BlocBuilder<GetCountriesDataBloc, GetCountriesDataState>(
                bloc: getCountryBloc,
                builder: (
                  BuildContext context,
                    GetCountriesDataState currentState,
                ) {
                  if (currentState is GetCountriesApiFetchingState) {
                    return CenterLoadingIndicator();
                  }
                  return Container();
                })),
      ],
    );
  }


  getCountries() async {
    countryDataEvent = GetCountriesEvent();
    getCountryBloc!.add(countryDataEvent!);
  }
  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
    ));
  }

  void retryCall() {
   if (countryDataEvent != null) {
      getCountryBloc!.add(countryDataEvent!);
      Navigator.pop(context);
    } else {
      print("last event is null @1311");
    }
  }
}
