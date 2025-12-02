/// Configuração de ambiente da aplicação
/// 
/// Este arquivo gerencia as URLs da API de acordo com o ambiente
/// (desenvolvimento, produção, etc.)

class Environment {
  // URL base da API
  // Em desenvolvimento: use localhost ou túnel Neon/Ngrok
  // Em produção: use a URL do Render
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: _defaultApiUrl,
  );

  // URL padrão (produção)
  static const String _defaultApiUrl = 'https://unidecide.onrender.com';

  // URLs alternativas para diferentes ambientes
  static const String productionUrl = 'https://unidecide.onrender.com';
  static const String developmentUrl = 'http://localhost:3000/api';
  
  // Detectar se está em modo debug
  static bool get isDebugMode {
    bool inDebugMode = false;
    assert(inDebugMode = true);
    return inDebugMode;
  }

  // Obter URL da API de acordo com o ambiente
  static String getApiUrl() {
    // Se API_BASE_URL foi definida via --dart-define, use ela
    if (apiBaseUrl != _defaultApiUrl) {
      return apiBaseUrl;
    }
    
    // Caso contrário, use a URL de produção
    // (você pode mudar isso para usar developmentUrl em modo debug se preferir)
    return productionUrl;
  }

  // Informações do ambiente
  static Map<String, dynamic> getInfo() {
    return {
      'apiUrl': getApiUrl(),
      'isDebug': isDebugMode,
      'environment': isDebugMode ? 'development' : 'production',
    };
  }
}
