import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import '../models/user.dart';
import '../models/auth_response.dart';
import '../models/test_question.dart';
import '../models/test_result.dart';
import '../config/environment.dart';
import 'auth_service.dart';

class ApiService {
  // URL base dinâmica baseada no ambiente
  static String get baseUrl => Environment.getApiUrl();
  
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
  };

  // Método auxiliar para log de debug
  static void _log(String message) {
    if (Environment.isDebugMode) {
      print(message);
    }
  }

  // Criar cliente HTTP personalizado para lidar com certificados e timeouts
  static http.Client _createHttpClient() {
    if (kIsWeb) {
      // Para web, usar cliente normal
      return http.Client();
    } else {
      // Para mobile/desktop, criar cliente customizado
      final httpClient = HttpClient()
        ..connectionTimeout = const Duration(seconds: 30)
        ..badCertificateCallback = 
            (X509Certificate cert, String host, int port) => true;
      return IOClient(httpClient);
    }
  }

  // Método genérico para fazer requisições HTTP
  static Future<http.Response> _makeRequest(
    String method,
    String endpoint,
    {
      Map<String, String>? headers,
      Object? body,
      int timeoutSeconds = 30,
    }
  ) async {
    final client = _createHttpClient();
    final uri = Uri.parse('$baseUrl/$endpoint'.replaceAll('//', '/'));
    
    _log('🌐 [HTTP] $method $uri');
    
    try {
      final requestFuture = _executeRequest(client, method, uri, headers, body);
      final response = await requestFuture.timeout(
        Duration(seconds: timeoutSeconds),
        onTimeout: () {
          throw Exception('Timeout após $timeoutSeconds segundos');
        },
      );

      _log('📥 [HTTP] Resposta: ${response.statusCode}');
      return response;
    } catch (e) {
      _log('💥 [HTTP] Erro: $e');
      rethrow;
    } finally {
      client.close();
    }
  }

  static Future<http.Response> _executeRequest(
    http.Client client,
    String method,
    Uri uri,
    Map<String, String>? headers,
    Object? body,
  ) async {
    switch (method.toUpperCase()) {
      case 'GET':
        return await client.get(uri, headers: headers);
      case 'POST':
        return await client.post(uri, headers: headers, body: body);
      case 'PUT':
        return await client.put(uri, headers: headers, body: body);
      case 'DELETE':
        return await client.delete(uri, headers: headers);
      default:
        throw Exception('Método HTTP não suportado: $method');
    }
  }

  // ========== MÉTODOS DE AUTENTICAÇÃO ==========

  // Cadastro de usuário
  static Future<AuthResponse> register(User user, String password) async {
    try {
      _log('🚀 [API] Tentando registrar usuário: ${user.email}');
      
      final response = await _makeRequest(
        'POST',
        'auth/register',
        headers: defaultHeaders,
        body: json.encode({
          'name': user.name,
          'email': user.email,
          'password': password,
        }),
      );

      _log('📡 [API] Resposta do registro - Status: ${response.statusCode}');
      _log('📡 [API] Resposta do registro - Body: ${response.body}');

      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        _log('✅ [API] Registro bem-sucedido!');
        return AuthResponse.fromJson(data);
      } else {
        final error = json.decode(response.body);
        _log('❌ [API] Erro no registro: ${error['message']}');
        return AuthResponse(
          success: false,
          message: error['message'] ?? 'Erro no cadastro',
        );
      }
    } catch (e) {
      _log('💥 [API] ERRO DE CONEXÃO: $e');
      return AuthResponse(
        success: false,
        message: 'Erro de conexão com o servidor. Verifique sua internet e tente novamente.',
      );
    }
  }

  // Login de usuário
  static Future<AuthResponse> login(String email, String password) async {
    try {
      _log('🚀 [API] Tentando login: $email');
      
      final response = await _makeRequest(
        'POST',
        'auth/login',
        headers: defaultHeaders,
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      _log('📡 [API] Resposta do login - Status: ${response.statusCode}');
      _log('📡 [API] Resposta do login - Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        
        if (data['success'] == true) {
          _log('✅ [API] Login válido pelo backend');
          return AuthResponse.fromJson(data);
        } else {
          _log('❌ [API] Backend rejeitou o login: ${data['message']}');
          return AuthResponse(
            success: false,
            message: data['message'] ?? 'Credenciais inválidas',
          );
        }
      } else {
        final error = json.decode(response.body);
        _log('❌ [API] Erro HTTP no login: ${error['message']}');
        return AuthResponse(
          success: false,
          message: error['message'] ?? 'Erro no login',
        );
      }
    } catch (e) {
      _log('💥 [API] ERRO DE CONEXÃO no login: $e');
      return AuthResponse(
        success: false,
        message: 'Erro de conexão com o servidor. Verifique sua internet e tente novamente.',
      );
    }
  }

  // Verificar token
  static Future<AuthResponse> verifyToken(String token) async {
    try {
      _log('🔐 [API] Verificando token...');
      
      final response = await _makeRequest(
        'GET',
        'auth/verify',
        headers: {
          ...defaultHeaders,
          'Authorization': 'Bearer $token',
        },
      );

      _log('📡 [API] Resposta da verificação - Status: ${response.statusCode}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return AuthResponse.fromJson(data);
      } else {
        _log('❌ [API] Token inválido');
        return AuthResponse(
          success: false,
          message: 'Token inválido',
        );
      }
    } catch (e) {
      _log('💥 [API] ERRO na verificação: $e');
      return AuthResponse(
        success: false,
        message: 'Erro de conexão',
      );
    }
  }

  // ========== MÉTODOS DO TESTE VOCACIONAL ==========

  // Obter perguntas do teste
  static Future<List<TestQuestion>?> getTestQuestions() async {
    try {
      _log('🚀 [API] Buscando perguntas do teste...');
      
      final response = await _makeRequest(
        'GET',
        'test/questions',
        headers: defaultHeaders,
      );

      _log('📡 [API] Resposta das perguntas - Status: ${response.statusCode}');
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Se a API retornar uma lista direta
        if (data is List) {
          _log('✅ [API] Perguntas carregadas: ${data.length}');
          return data.map((q) => TestQuestion.fromJson(q)).toList();
        }

        // Se a API retornar um objeto com 'success' e 'questions'
        if (data['success'] == true && data['questions'] is List) {
          _log('✅ [API] Perguntas carregadas: ${data['questions'].length}');
          return (data['questions'] as List).map((q) => TestQuestion.fromJson(q)).toList();
        }

        // Caso inesperado
        _log('⚠️ [API] Resposta inesperada: $data');
        return null;
      } else {
        _log('❌ [API] Erro HTTP: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      _log('💥 [API] ERRO ao carregar perguntas: $e');
      return null;
    }
  }

  // Salvar resultado do teste (VERSÃO ÚNICA - com autenticação)
  static Future<bool> saveTestResult(TestResult result) async {
    try {
      _log('🚀 [API] Tentando salvar resultado do teste...');
      _log('📊 [API] Dados do resultado: ${json.encode(result.toJson())}');
      
      // Obter token de autenticação
      final token = await AuthService.getToken();
      final headersWithAuth = {
        ...defaultHeaders,
        if (token != null) 'Authorization': 'Bearer $token',
      };

      final response = await _makeRequest(
        'POST',
        'test/results',
        headers: headersWithAuth,
        body: json.encode(result.toJson()),
      );

      _log('📡 [API] Resposta do salvamento - Status: ${response.statusCode}');
      _log('📡 [API] Resposta do salvamento - Body: ${response.body}');

      if (response.statusCode == 201) {
        _log('✅ [API] Resultado salvo com sucesso no backend');
        return true;
      } else {
        _log('❌ [API] Erro ao salvar resultado: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      _log('💥 [API] ERRO ao salvar resultado: $e');
      return false;
    }
  }

  // Obter resultados do usuário (VERSÃO ÚNICA - com autenticação)
  static Future<List<TestResult>?> getUserTestResults(String userId) async {
    try {
      _log('🚀 [API] Buscando resultados do usuário: $userId');
      
      // Obter token de autenticação
      final token = await AuthService.getToken();
      final headersWithAuth = {
        ...defaultHeaders,
        if (token != null) 'Authorization': 'Bearer $token',
      };

      final response = await _makeRequest(
        'GET',
        'test/results',
        headers: headersWithAuth,
      );

      _log('📡 [API] Resposta da busca - Status: ${response.statusCode}');
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success'] == true) {
          _log('✅ [API] Resultados carregados: ${data['results']?.length ?? 0}');
          return (data['results'] as List).map((r) => TestResult.fromJson(r)).toList();
        }
      } else {
        _log('❌ [API] Erro HTTP: ${response.statusCode}');
      }
      return null;
    } catch (e) {
      _log('💥 [API] ERRO ao buscar resultados: $e');
      return null;
    }
  }

  // Método de teste de conexão com a API
  static Future<bool> testConnection() async {
    try {
      _log('🧪 [API] Testando conexão com a API...');
      
      final response = await _makeRequest(
        'GET',
        'health',
        headers: defaultHeaders,
        timeoutSeconds: 10,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _log('✅ [API] Conexão testada com sucesso: ${data['status']}');
        return true;
      } else {
        _log('❌ [API] Health check falhou: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      _log('💥 [API] ERRO no teste de conexão: $e');
      return false;
    }
  }
}
