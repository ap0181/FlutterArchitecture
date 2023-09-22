import 'package:business_logic/blocs/GetCountriesDataBloc.dart';
import 'package:business_logic/services/repositories/ApiBloc_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'CountryScreen.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
      providers: [],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<GetCountriesDataBloc>(
              create: (context) => GetCountriesDataBloc(ApiBlocRepository())),
        ],
        child: MyApp(),
      )));
}


class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CountryScreen(),
      navigatorKey: navigatorKey,
      initialRoute: "/",
    );
  }
}
