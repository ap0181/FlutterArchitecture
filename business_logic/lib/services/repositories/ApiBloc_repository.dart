import 'dart:collection';

import 'package:business_logic/utils/DatabaseKeyConstant.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:dio/dio.dart';

import '../../models/response/GetCountriesDataResponse.dart';
import '../data_sources/ParseApiResponse.dart';
import '../data_sources/ParseErrorResponse.dart';
import '../data_sources/PathBuilder.dart';
import 'AppExceptions.dart';

typedef void VoidCallback();

class ApiBlocRepository {
  var dio = Dio.Dio();

  static dynamic Function()? simples;

  static final ApiBlocRepository _instance = ApiBlocRepository._internal();

  factory ApiBlocRepository({Function? onRevoke}) {
    return _instance;
  }

  ApiBlocRepository._internal() {
    dio.interceptors.add(LogInterceptor(responseBody: true));
    dio.options.connectTimeout = 100000;
    dio.options.receiveTimeout = 60000;
  }

  Map<String, Object> getLoginHeader() {
    Map<String, Object> header = new HashMap<String, Object>();

    header["Authorization"] = DatabaseKeyConstant
        .ACCESS_TOKEN; // sl.get<UserPersistData>().signInResponse.data!.accessToken!;
    header["Accept"] = DatabaseKeyConstant.CONTENT_TYPE;
    header["Content-Type"] = DatabaseKeyConstant.CONTENT_TYPE;
    header["x-api-key"] = DatabaseKeyConstant.X_API_KEY;
    header["x-api-secret"] = DatabaseKeyConstant.X_API_SECRET;
    return header;
  }

  Future<GetCountriesDataResponse> GetCountries() async {
    try {
      Dio.Response response = await dio.get(PathBuilder.pathForGetCountries(),
          options: Dio.Options(headers: getLoginHeader()));
      return ParseApiResponse().parseCountryDataResponse(response, false);
    } on Dio.DioError catch (e) {
      print("@51 url is :${e.requestOptions.path}");
      if (e.type == Dio.DioErrorType.receiveTimeout ||
          e.type == Dio.DioErrorType.connectTimeout ||
          e.type == Dio.DioErrorType.other) {
        throw NoInternetException("");
      } else if (e.response!.statusCode == 400 ||
          e.response!.statusCode == 422 ||
          e.response!.statusCode == 403 ||
          e.response!.statusCode == 404 ||
          e.response!.statusCode == 429) {
        print("We got error in get country api :: ${e.response!.data}");
        throw ApiFailedException(
            ParseErrorResponse().parseApiErrorResponse(e.response!, true));
      } else if (e.response!.statusCode == 503) {
        throw ServerNotRespondingException("");
      } else if (e.response!.statusCode == 502) {
        throw UserBlockException("");
      } else {
        return ParseApiResponse().parseCountryDataResponse(e.response!, true);
      }
    }
  }
}
