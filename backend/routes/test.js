const express = require('express');
const { getQuestions, saveTestResult, getUserResults } = require('../controllers/testController');
const { validateTestResult } = require('../middleware/validation');
const authMiddleware = require('../middleware/auth');

const router = express.Router();

router.get('/questions', getQuestions);
router.post('/results', authMiddleware, validateTestResult, saveTestResult);
router.get('/results', authMiddleware, getUserResults);

module.exports = router;