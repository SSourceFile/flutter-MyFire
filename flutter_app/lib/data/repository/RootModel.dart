
class RootModel<T>{
  RootModel({this.data, this.errorCode, this.errorMsg, this.page, this.page_count, this.status, this.total_counts});

  T data;
  int errorCode;
  String errorMsg;
  int page;
  int page_count;
  int status;
  int total_counts;

  RootModel.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    data = json['data'];
    errorMsg = json['errorMsg'];
    page = json['page'];
    page_count = json['page_count'];
    status = json['status'];
    total_counts = json['total_counts'];

  }
}