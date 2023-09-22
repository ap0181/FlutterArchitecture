class GetCountriesDataResponse {
  bool? success;
  String? message;
  bool? error;

  GetCountriesDataResponse({this.success, this.message, this.error});

  GetCountriesDataResponse.fromJson(Map<String, dynamic> json,bool isError, int statusCode) {
    success = json['success'];
    message = json['message'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['error'] = this.error;
    return data;
  }
}
