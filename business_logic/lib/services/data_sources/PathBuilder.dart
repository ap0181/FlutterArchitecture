import 'package:business_logic/utils/DatabaseKeyConstant.dart';

class PathBuilder {
  static String baseUrl = DatabaseKeyConstant.BASE_URL;

  //Get Path for countries data
  static String pathForGetCountries() {
    return '${baseUrl}all';
  }
}
