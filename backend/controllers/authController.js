const jwt = require('jsonwebtoken');
const User = require('../models/User');
const { JWT_SECRET } = require('../utils/constants');

const register = async (req, res) => {
  try {
    const { name, email, password } = req.body;

    console.log('📝 Tentativa de registro:', email);

    // Verificar se usuário já existe
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      console.log('❌ Email já cadastrado:', email);
      return res.status(400).json({ 
        success: false, 
        message: 'Este email já está cadastrado' 
      });
    }

    // Criar usuário (a senha é hasheada automaticamente no model)
    const user = new User({ name, email, password });
    await user.save();
    
    console.log('✅ Usuário criado com ID:', user._id);

    // Gerar token
    const token = jwt.sign(
      { userId: user._id },
      JWT_SECRET,
      { expiresIn: '7d' }
    );

    res.status(201).json({
      success: true,
      message: 'Usuário criado com sucesso',
      user: {
        id: user._id,
        name: user.name,
        email: user.email,
      },
      token,
    });
  } catch (error) {
    console.error('❌ Erro no registro:', error);
    
    if (error.code === 11000) {
      return res.status(400).json({ 
        success: false, 
        message: 'Este email já está cadastrado' 
      });
    }
    
    res.status(500).json({ 
      success: false, 
      message: 'Erro no servidor' 
    });
  }
};

const login = async (req, res) => {
  try {
    const { email, password } = req.body;

    console.log('🔐 Tentativa de login:', email);

    // Verificar se usuário existe
    const user = await User.findOne({ email });
    if (!user) {
      console.log('❌ Usuário não encontrado:', email);
      return res.status(400).json({ 
        success: false, 
        message: 'Credenciais inválidas' 
      });
    }

    // Verificar senha usando o método do model
    const isMatch = await user.comparePassword(password);
    if (!isMatch) {
      console.log('❌ Senha incorreta para:', email);
      return res.status(400).json({ 
        success: false, 
        message: 'Credenciais inválidas' 
      });
    }

    console.log('✅ Login bem-sucedido para:', email);

    // Gerar token
    const token = jwt.sign(
      { userId: user._id },
      JWT_SECRET,
      { expiresIn: '7d' }
    );

    res.json({
      success: true,
      message: 'Login realizado com sucesso',
      user: {
        id: user._id,
        name: user.name,
        email: user.email,
      },
      token,
    });
  } catch (error) {
    console.error('❌ Erro no login:', error);
    res.status(500).json({ 
      success: false, 
      message: 'Erro no servidor' 
    });
  }
};

const verify = async (req, res) => {
  res.json({
    success: true,
    user: {
      id: req.user._id,
      name: req.user.name,
      email: req.user.email,
    },
  });
};

module.exports = {
  register,
  login,
  verify
};