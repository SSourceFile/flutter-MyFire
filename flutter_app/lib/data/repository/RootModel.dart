
class RootModel{
  RootModel({this.data, this.errorCode, this.errorMsg});

  dynamic data;
  int errorCode;
  String errorMsg;

  RootModel.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    data = json['data'];
    errorMsg = json['errorMsg'];
  }
}