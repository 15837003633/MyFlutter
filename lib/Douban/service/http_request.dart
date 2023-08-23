import 'package:dio/dio.dart';

import 'config.dart';

class HttpRequest {
  static final baseOption = BaseOptions(
      baseUrl: HttpBaseConfig.baseURL,
      method: "get",
      connectTimeout: Duration(seconds: 20));
  static final dio = Dio(baseOption);

  static Future<T?> requets<T>(String url,
      {Map<String, dynamic>? params}) async {
    try {
      final option = Options();
      Response<T> rep =
          await dio.request<T>(url, queryParameters: params, options: option);
      return rep.data;
    } on DioException catch (error) {
      return Future.error(error);
    }
  }
}
