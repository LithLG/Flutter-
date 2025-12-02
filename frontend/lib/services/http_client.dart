// lib/services/http_client.dart
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

class AppHttpClient {
  static http.Client create() {
    if (Platform.isAndroid || Platform.isIOS) {
      // Para mobile, criar cliente customizado
      final httpClient = HttpClient()
        ..connectionTimeout = const Duration(seconds: 30)
        ..badCertificateCallback = 
            (X509Certificate cert, String host, int port) => true;
      return IOClient(httpClient);
    } else {
      // Para web, usar cliente normal
      return http.Client();
    }
  }
  
  // Método para fazer requisições seguras
  static Future<http.Response> getRequest(String url, 
      {Map<String, String>? headers}) async {
    final client = create();
    try {
      final uri = Uri.parse(url);
      print('🌐 GET $url');
      
      final response = await client.get(uri, headers: headers)
        .timeout(const Duration(seconds: 30));
      
      return response;
    } finally {
      client.close();
    }
  }
  
  static Future<http.Response> postRequest(String url,
      {Map<String, String>? headers, Object? body}) async {
    final client = create();
    try {
      final uri = Uri.parse(url);
      print('🌐 POST $url');
      
      final response = await client.post(uri, 
          headers: headers, body: body)
        .timeout(const Duration(seconds: 30));
      
      return response;
    } finally {
      client.close();
    }
  }
}
