const validateRegister = (req, res, next) => {
  const { name, email, password } = req.body;
  
  if (!name || !email || !password) {
    return res.status(400).json({
      success: false,
      message: 'Nome, email e senha são obrigatórios'
    });
  }
  
  if (password.length < 6) {
    return res.status(400).json({
      success: false,
      message: 'A senha deve ter pelo menos 6 caracteres'
    });
  }
  
  if (!/\S+@\S+\.\S+/.test(email)) {
    return res.status(400).json({
      success: false,
      message: 'Email inválido'
    });
  }
  
  next();
};

const validateLogin = (req, res, next) => {
  const { email, password } = req.body;
  
  if (!email || !password) {
    return res.status(400).json({
      success: false,
      message: 'Email e senha são obrigatórios'
    });
  }
  
  next();
};

const validateTestResult = (req, res, next) => {
  const { id, completedAt, areaScores, topAreas, responses, summary } = req.body;
  
  if (!id || !completedAt || !areaScores || !topAreas || !responses || !summary) {
    return res.status(400).json({
      success: false,
      message: 'Dados incompletos do resultado do teste'
    });
  }
  
  if (!Array.isArray(responses) || responses.length === 0) {
    return res.status(400).json({
      success: false,
      message: 'Respostas do teste são obrigatórias'
    });
  }
  
  if (!Array.isArray(topAreas) || topAreas.length === 0) {
    return res.status(400).json({
      success: false,
      message: 'Áreas principais são obrigatórias'
    });
  }
  
  next();
};

module.exports = {
  validateRegister,
  validateLogin,
  validateTestResult
};