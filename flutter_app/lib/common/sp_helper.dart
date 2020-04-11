import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:flustars/flustars.dart';
import 'package:flutterapp/common/common.dart';
import 'package:flutterapp/data/protocol/models.dart';
import 'package:flutterapp/models/models.dart';

class SpHelper {
  /// T 用于区分存储类型
  /// Example.
  /// SpHelper.putObject<int>(key, value);
  /// SpHelper.putObject<double>(key, value);
  /// SpHelper.putObject<bool>(key, value);
  /// SpHelper.putObject<String>(key, value);
  /// SpHelper.putObject<List>(key, value);
  ///
  /// SpHelper.putObject(key, UserModel);
  ///
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
