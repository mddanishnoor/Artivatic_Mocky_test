class ResponseAPI {
  Status? status;
  Object? data;
  ResponseAPI({this.data, this.status});
}

enum Status { success, failed }
