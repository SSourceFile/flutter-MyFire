
class RootModel<T>{
  RootModel(this.data, this.errCode, this.errMsg);

  T data;
  int errCode;
  String errMsg;
}