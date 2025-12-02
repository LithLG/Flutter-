import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';
import '../models/auth_response.dart';
import '../models/test_question.dart';
import '../models/test_result.dart';
import '../config/environment.dart';
import 'auth_service.dart';

class ApiService {
  // URL base dinâmica baseada no ambiente
  static String get baseUrl => Environment.getApiUrl();
  
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  // Método auxiliar para log de debug
  static void _log(String message) {
    if (Environment.isDebugMode) {
      print(message);
    }
  }

  // ========== MÉTODOS DE AUTENTICAÇÃO ==========

  // Cadastro de usuário
  static Future<AuthResponse> register(User user, String password) async {
    try {
      _log('🚀 [API] Tentando registrar usuário: ${user.email}');
      _log('📍 [API] URL: $baseUrl/auth/register');
      
      final response = await http.post(
        Uri.parse('$baseUrl/auth/register'),
        headers: headers,
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
      _log('📍 [API] URL: $baseUrl/auth/login');
      
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: headers,
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
      _log('📍 [API] URL: $baseUrl/auth/verify');
      
      final response = await http.get(
        Uri.parse('$baseUrl/auth/verify'),
        headers: {
          ...headers,
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
      _log('📍 [API] URL: $baseUrl/test/questions');
      
      final response = await http.get(
        Uri.parse('$baseUrl/test/questions'),
        headers: headers,
      );

      _log('📡 [API] Resposta das perguntas - Status: ${response.statusCode}');
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success'] == true) {
          _log('✅ [API] Perguntas carregadas: ${data['questions']?.length ?? 0}');
          return (data['questions'] as List).map((q) => TestQuestion.fromJson(q)).toList();
        }
      }
      return null;
    } catch (e) {
      _log('💥 [API] ERRO ao carregar perguntas: $e');
      return null;
    }
  }

  // Salvar resultado do teste (VERSÃO ÚNICA - com autenticação)
  static Future<bool> saveTestResult(TestResult result) async {
    try {
      _log('🚀 [API] Tentando salvar resultado do teste...');
      _log('📍 [API] URL: $baseUrl/test/results');
      _log('📊 [API] Dados do resultado: ${json.encode(result.toJson())}');
      
      // Obter token de autenticação
      final token = await AuthService.getToken();
      final headersWithAuth = {
        ...headers,
        if (token != null) 'Authorization': 'Bearer $token',
      };

      final response = await http.post(
        Uri.parse('$baseUrl/test/results'),
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
      _log('📍 [API] URL: $baseUrl/test/results');
      
      // Obter token de autenticação
      final token = await AuthService.getToken();
      final headersWithAuth = {
        ...headers,
        if (token != null) 'Authorization': 'Bearer $token',
      };

      final response = await http.get(
        Uri.parse('$baseUrl/test/results'),
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
}
