import 'package:flutter/material.dart';
import 'home/home_page.dart';
import 'services/auth_service.dart';
import 'models/user.dart';

class UniDecideApp extends StatefulWidget {
  @override
  _UniDecideAppState createState() => _UniDecideAppState();
}

class _UniDecideAppState extends State<UniDecideApp> {
  bool _isLoading = true;
  User? _currentUser;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    print('🚀 [App] Inicializando aplicação...');
    
    try {
      // Verificar se usuário está logado
      final isLoggedIn = await AuthService.isLoggedIn();
      if (isLoggedIn) {
        _currentUser = await AuthService.getUser();
        print('✅ [App] Usuário logado: ${_currentUser?.email}');
        
        // 🔥 MIGRAR RESULTADO TEMPORÁRIO SE EXISTIR
        await AuthService.checkAndMigrateTemporaryResult();
      } else {
        print('🔐 [App] Nenhum usuário logado');
      }
    } catch (e) {
      print('❌ [App] Erro na inicialização: $e');
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UniDecide',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter',
      ),
      home: _isLoading 
          ? _buildLoadingScreen()
          : HomePage(initialUser: _currentUser),
      debugShowCheckedModeBanner: false,
    );
  }

  Widget _buildLoadingScreen() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png', // Adicione um logo se tiver
              width: 100,
              height: 100,
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text(
              'Carregando UniDecide...',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}