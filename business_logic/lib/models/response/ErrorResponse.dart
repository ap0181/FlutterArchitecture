class ErrorResponse {
  int? status;
  String? title;
  String? type;
  Errors? errors;

  ErrorResponse({this.status, this.title, this.type});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['title'] != null) title = json['title'];
    if (json['message'] != null) title = json['message'].toString();
    type = json['type'];
    errors =
        json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['title'] = this.title;
    data['message'] = this.title;
    data['type'] = this.type;
    if (this.errors != null) {
      data['errors'] = this.errors!.toJson();
    }
    return data;
  }
}

class Errors {
  String? customerCreate;

  Errors({this.customerCreate});

  Errors.fromJson(Map<String, dynamic> json) {
    customerCreate = json['.customer_create'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['.customer_create'] = this.customerCreate;
    return data;
  }
}
