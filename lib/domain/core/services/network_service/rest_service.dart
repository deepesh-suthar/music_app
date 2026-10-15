import 'package:http/http.dart' as http;

abstract final class RESTService {
  static Future<http.Response> performGETRequest({
    required String httpUrl,
    http.Client? client,
    bool isAuth = false,
    String token = '',
    Map<String, String>? header,
    Map<String, String> param = const {},
    Duration timeout = const Duration(seconds: 15),
  }) async {
    final uri = Uri.parse(httpUrl).replace(
      queryParameters: {...Uri.parse(httpUrl).queryParameters, ...param},
    );
    final headers = <String, String>{
      'Access-Control-Allow-Origin': '*',
      ...?header,
      if (isAuth && token.isNotEmpty) 'Authorization': 'Bearer $token',
    };
    final response = await (client ?? http.Client())
        .get(uri, headers: headers)
        .timeout(timeout);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    }
    throw response;
  }
}
