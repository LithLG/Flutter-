import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../services/auth_service.dart';
import '../models/user.dart';
import '../theme/app_colors.dart';

class LoginDialog extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool success)? onAuthSuccess;

  const LoginDialog({required this.isDarkMode, this.onAuthSuccess});

  @override
  _LoginDialogState createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  
  bool _isLoading = false;
  // 🔥 NOVOS ESTADOS PARA VISUALIZAR SENHA
  bool _obscureLoginPassword = true;
  bool _obscureRegisterPassword = true;
  bool _obscureRegisterConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Color _getBackgroundColor() => widget.isDarkMode ? AppColors.darkBackground : AppColors.lightBackground;
  Color _getTextColor() => widget.isDarkMode ? AppColors.darkText : AppColors.lightText;
  Color _getGreyTextColor() => widget.isDarkMode ? AppColors.darkGreyText : AppColors.lightGreyText;
  Color _getCardColor() => widget.isDarkMode ? AppColors.darkCard : Color(0xFFf8f9ff);

  void _handleLogin() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      _showSnackBar('Por favor, preencha todos os campos');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final response = await ApiService.login(
      _emailController.text,
      _passwordController.text,
    );

    setState(() {
      _isLoading = false;
    });

    if (response.success && response.user != null && response.token != null) {
      // Salvar dados do usuário
      await AuthService.saveUserData(response.token!, response.user!);
      
      // 🔥 MIGRAR RESULTADO TEMPORÁRIO
      await AuthService.checkAndMigrateTemporaryResult();
      
      Navigator.pop(context);
      _showSnackBar('Login realizado com sucesso!', isError: false);
      
      if (widget.onAuthSuccess != null) {
        widget.onAuthSuccess!(true);
      }
    } else {
      _showSnackBar(response.message);
    }
  }

  void _handleRegister() async {
    if (_nameController.text.isEmpty || 
        _emailController.text.isEmpty || 
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty) {
      _showSnackBar('Por favor, preencha todos os campos');
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      _showSnackBar('As senhas não coincidem');
      return;
    }

    if (_passwordController.text.length < 6) {
      _showSnackBar('A senha deve ter pelo menos 6 caracteres');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final user = User(
      id: '',
      name: _nameController.text,
      email: _emailController.text,
    );

    final response = await ApiService.register(
      user,
      _passwordController.text,
    );

    setState(() {
      _isLoading = false;
    });

    if (response.success && response.user != null && response.token != null) {
      // Salvar dados do usuário
      await AuthService.saveUserData(response.token!, response.user!);
      
      // 🔥 MIGRAR RESULTADO TEMPORÁRIO
      await AuthService.checkAndMigrateTemporaryResult();
      
      Navigator.pop(context);
      _showSnackBar('Conta criada com sucesso!', isError: false);
      
      if (widget.onAuthSuccess != null) {
        widget.onAuthSuccess!(true);
      }
    } else {
      _showSnackBar(response.message);
    }
  }

  void _showSnackBar(String message, {bool isError = true}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(20),
      child: Container(
        width: double.maxFinite,
        constraints: BoxConstraints(
          maxWidth: 450,
          maxHeight: MediaQuery.of(context).size.height * 0.75,
        ),
        decoration: BoxDecoration(
          color: _getBackgroundColor(),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: _getBackgroundColor(),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: TabBar(
                controller: _tabController,
                labelColor: AppColors.primary,
                unselectedLabelColor: _getGreyTextColor(),
                indicatorColor: AppColors.primary,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                tabs: [
                  Tab(text: 'Login'),
                  Tab(text: 'Cadastro'),
                ],
              ),
            ),
            
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildLoginForm(),
                  _buildRegisterForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.person, size: 50, color: AppColors.primary),
          SizedBox(height: 10),
          Text(
            'Bem-vindo de volta!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: _getTextColor(),
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Faça login em sua conta',
            style: TextStyle(
              color: _getGreyTextColor(),
              fontSize: 13,
            ),
          ),
          SizedBox(height: 15),
          
          TextField(
            controller: _emailController,
            style: TextStyle(color: _getTextColor(), fontSize: 14),
            decoration: InputDecoration(
              labelText: 'E-mail',
              labelStyle: TextStyle(color: _getGreyTextColor(), fontSize: 14),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: _getCardColor(),
              prefixIcon: Icon(Icons.email, color: _getGreyTextColor(), size: 20),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 12),
          
          // 🔥 CAMPO DE SENHA COM BOTÃO DE VISUALIZAR
          TextField(
            controller: _passwordController,
            obscureText: _obscureLoginPassword,
            style: TextStyle(color: _getTextColor(), fontSize: 14),
            decoration: InputDecoration(
              labelText: 'Senha',
              labelStyle: TextStyle(color: _getGreyTextColor(), fontSize: 14),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: _getCardColor(),
              prefixIcon: Icon(Icons.lock, color: _getGreyTextColor(), size: 20),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureLoginPassword ? Icons.visibility : Icons.visibility_off,
                  color: _getGreyTextColor(),
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    _obscureLoginPassword = !_obscureLoginPassword;
                  });
                },
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
          SizedBox(height: 8),
          
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: _isLoading ? null : () {
                _showSnackBar('Funcionalidade de recuperação de senha em desenvolvimento');
              },
              child: Text(
                'Esqueceu a senha?',
                style: TextStyle(color: AppColors.primary, fontSize: 13),
              ),
            ),
          ),
          SizedBox(height: 12),
          
          _isLoading 
              ? Center(child: CircularProgressIndicator())
              : SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: _handleLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(
                      'Entrar',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
          SizedBox(height: 12),
          
          TextButton(
            onPressed: _isLoading ? null : () => _tabController.animateTo(1),
            child: RichText(
              text: TextSpan(
                text: 'Não tem uma conta? ',
                style: TextStyle(color: _getGreyTextColor(), fontSize: 13),
                children: [
                  TextSpan(
                    text: 'Cadastre-se',
                    style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterForm() {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.person_add, size: 50, color: AppColors.primary),
          SizedBox(height: 10),
          Text(
            'Criar Nova Conta',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: _getTextColor(),
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Junte-se à nossa comunidade',
            style: TextStyle(
              color: _getGreyTextColor(),
              fontSize: 13,
            ),
          ),
          SizedBox(height: 15),
          
          TextField(
            controller: _nameController,
            style: TextStyle(color: _getTextColor(), fontSize: 14),
            decoration: InputDecoration(
              labelText: 'Nome completo',
              labelStyle: TextStyle(color: _getGreyTextColor(), fontSize: 14),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: _getCardColor(),
              prefixIcon: Icon(Icons.person, color: _getGreyTextColor(), size: 20),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
          SizedBox(height: 12),
          
          TextField(
            controller: _emailController,
            style: TextStyle(color: _getTextColor(), fontSize: 14),
            decoration: InputDecoration(
              labelText: 'E-mail',
              labelStyle: TextStyle(color: _getGreyTextColor(), fontSize: 14),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: _getCardColor(),
              prefixIcon: Icon(Icons.email, color: _getGreyTextColor(), size: 20),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 12),
          
          // 🔥 CAMPO DE SENHA COM BOTÃO DE VISUALIZAR
          TextField(
            controller: _passwordController,
            obscureText: _obscureRegisterPassword,
            style: TextStyle(color: _getTextColor(), fontSize: 14),
            decoration: InputDecoration(
              labelText: 'Senha',
              labelStyle: TextStyle(color: _getGreyTextColor(), fontSize: 14),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: _getCardColor(),
              prefixIcon: Icon(Icons.lock, color: _getGreyTextColor(), size: 20),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureRegisterPassword ? Icons.visibility : Icons.visibility_off,
                  color: _getGreyTextColor(),
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    _obscureRegisterPassword = !_obscureRegisterPassword;
                  });
                },
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
          SizedBox(height: 12),
          
          // 🔥 CAMPO DE CONFIRMAR SENHA COM BOTÃO DE VISUALIZAR
          TextField(
            controller: _confirmPasswordController,
            obscureText: _obscureRegisterConfirmPassword,
            style: TextStyle(color: _getTextColor(), fontSize: 14),
            decoration: InputDecoration(
              labelText: 'Confirmar Senha',
              labelStyle: TextStyle(color: _getGreyTextColor(), fontSize: 14),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: _getCardColor(),
              prefixIcon: Icon(Icons.lock_outline, color: _getGreyTextColor(), size: 20),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureRegisterConfirmPassword ? Icons.visibility : Icons.visibility_off,
                  color: _getGreyTextColor(),
                  size: 20,
                ),
                onPressed: () {
                  setState(() {
                    _obscureRegisterConfirmPassword = !_obscureRegisterConfirmPassword;
                  });
                },
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
          SizedBox(height: 15),
          
          _isLoading 
              ? Center(child: CircularProgressIndicator())
              : SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: _handleRegister,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(
                      'Criar Conta',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
          SizedBox(height: 12),
          
          TextButton(
            onPressed: _isLoading ? null : () => _tabController.animateTo(0),
            child: RichText(
              text: TextSpan(
                text: 'Já tem uma conta? ',
                style: TextStyle(color: _getGreyTextColor(), fontSize: 13),
                children: [
                  TextSpan(
                    text: 'Fazer Login',
                    style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}