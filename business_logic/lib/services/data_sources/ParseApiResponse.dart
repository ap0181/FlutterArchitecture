
import 'package:business_logic/models/response/GetCountriesDataResponse.dart';
import 'package:dio/dio.dart' as Dio;


class ParseApiResponse {

  GetCountriesDataResponse parseCountryDataResponse(
      Dio.Response response, bool isError) {
    return GetCountriesDataResponse.fromJson(
        response.data, isError, response.statusCode!);
  }
}
