
class RootModel<T>{
  RootModel({this.data, this.errorCode, this.errorMsg});

  T data;
  int errorCode;
  String errorMsg;

  RootModel.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    data = json['data'];
    errorMsg = json['errorMsg'];
  }
}