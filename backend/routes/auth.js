const express = require('express');
const { register, login, verify } = require('../controllers/authController');
const { validateRegister, validateLogin } = require('../middleware/validation');
const authMiddleware = require('../middleware/auth');

const router = express.Router();

router.post('/register', validateRegister, register);
router.post('/login', validateLogin, login);
router.get('/verify', authMiddleware, verify);

module.exports = router;