import 'package:flustars/flustars.dart';
import 'package:flutterapp/common/common.dart';

class SpHelper {

  static void _putObject<T>(String key, Object value) {
    switch (T) {
      case int:
        SpUtil.putInt(key, value);
        break;
      case double:
        SpUtil.putDouble(key, value);
        break;
      case bool:
        SpUtil.putBool(key, value);
        break;
      case String:
        SpUtil.putString(key, value);
        break;
      case List:
        SpUtil.putStringList(key, value);
        break;
      default:
        SpUtil.putObject(key, value);
        break;
    }
  }

  static Object getData<T>(String key, Object value){
    switch (T) {
      case int:
        SpUtil.getInt(key);
        break;
      case double:
        SpUtil.getDouble(key);
        break;
      case bool:
        SpUtil.getBool(key);
        break;
      case String:
        SpUtil.getString(key);
        break;
      case List:
        SpUtil.getStringList(key);
        break;
      default:
        SpUtil.getObject(key);
        break;
    }
  }

  static String getThemeColor() {
    return SpUtil.getString(Constant.key_theme_color,
        defValue: 'deepPurpleAccent');
  }
}
