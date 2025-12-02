const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
require('dotenv').config();

const app = express();

// Configuração de CORS para produção
const corsOptions = {
  origin: process.env.CORS_ORIGIN || '*',
  credentials: true,
  optionsSuccessStatus: 200
};

// Middlewares
app.use(express.json());
app.use(cors(corsOptions));

// Conexão com MongoDB usando variável de ambiente
const MONGODB_URI = process.env.MONGODB_URI || 'mongodb://localhost:27017/unidecide';

mongoose.connect(MONGODB_URI)
  .then(() => {
    console.log('✅ Conectado ao MongoDB');
    console.log(`📍 Database: ${MONGODB_URI.includes('localhost') ? 'Local' : 'Cloud'}`);
  })
  .catch((err) => {
    console.error('❌ Erro ao conectar ao MongoDB:', err);
    process.exit(1); // Encerra o processo se não conseguir conectar ao banco
  });

// Rotas
app.use('/api/auth', require('./routes/auth'));
app.use('/api/test', require('./routes/test'));

// Rota de Health Check
app.get('/api/health', (req, res) => {
  res.json({
    status: 'ok',
    message: 'API funcionando!',
    timestamp: new Date(),
    database: mongoose.connection.readyState === 1 ? 'Conectado' : 'Desconectado',
    environment: process.env.NODE_ENV || 'development'
  });
});

// Rota raiz
app.get('/', (req, res) => {
  res.json({
    name: 'UniDecide API',
    version: '1.0.0',
    status: 'online',
    endpoints: {
      health: '/api/health',
      auth: '/api/auth',
      test: '/api/test'
    }
  });
});

// Middleware para rotas não encontradas (404) - AJUSTADO
app.use((req, res) => {
  res.status(404).json({
    success: false,
    message: 'Rota não encontrada'
  });
});

// Middleware de erro global
app.use((error, req, res, next) => {
  console.error('❌ Erro não tratado:', error);
  res.status(500).json({
    success: false,
    message: 'Erro interno do servidor'
  });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, '0.0.0.0', () => {
  console.log(`🚀 Servidor rodando na porta ${PORT}`);
  console.log(`🌍 Ambiente: ${process.env.NODE_ENV || 'development'}`);
  console.log(`📊 Health check: http://localhost:${PORT}/api/health`);
});
