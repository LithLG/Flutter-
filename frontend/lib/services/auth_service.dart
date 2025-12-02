import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import 'test_service.dart';

class AuthService {
  static const String _tokenKey = 'user_token';
  static const String _userKey = 'user_data';

    static Future<void> checkAndMigrateTemporaryResult() async {
    try {
      final user = await getUser();
      if (user != null) {
        await TestService.migrateTemporaryResult(user.id);
      }
    } catch (e) {
      print('❌ [AUTH] Erro ao migrar resultado temporário: $e');
    }
  }

  // Salvar token e dados do usuário
  static Future<void> saveUserData(String token, User user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_tokenKey, token);
      await prefs.setString(_userKey, json.encode({
        'id': user.id,
        'name': user.name,
        'email': user.email,
      }));
      print('✅ [AUTH] Dados do usuário salvos: ${user.email}');
    } catch (e) {
      print('❌ [AUTH] Erro ao salvar dados: $e');
    }
  }

  // Obter token salvo
  static Future<String?> getToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_tokenKey);
    } catch (e) {
      print('❌ [AUTH] Erro ao obter token: $e');
      return null;
    }
  }

  // Obter usuário salvo
  static Future<User?> getUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userData = prefs.getString(_userKey);
      if (userData != null) {
        final userMap = json.decode(userData);
        return User.fromJson(userMap);
      }
      return null;
    } catch (e) {
      print('❌ [AUTH] Erro ao obter usuário: $e');
      return null;
    }
  }

  // Fazer logout
  static Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_tokenKey);
      await prefs.remove(_userKey);
      print('✅ [AUTH] Logout realizado');
    } catch (e) {
      print('❌ [AUTH] Erro no logout: $e');
    }
  }

  // Verificar se usuário está logado - VERSÃO SIMPLIFICADA
  static Future<bool> isLoggedIn() async {
    try {
      final token = await getToken();
      final user = await getUser();
      
      final isLogged = token != null && 
                      token.isNotEmpty && 
                      user != null && 
                      user.id.isNotEmpty;
      
      print('🔐 [AUTH] Status login - Token: ${token != null ? "SIM" : "NÃO"}, '
            'Usuário: ${user != null ? "SIM" : "NÃO"}, '
            'Logado: $isLogged');
      
      return isLogged;
    } catch (e) {
      print('❌ [AUTH] Erro ao verificar login: $e');
      return false;
    }
  }
}