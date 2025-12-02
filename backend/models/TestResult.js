const mongoose = require('mongoose');

const QuestionResponseSchema = new mongoose.Schema({
  questionId: {
    type: String,
    required: true
  },
  optionId: {
    type: String,
    required: true
  },
  questionText: {
    type: String,
    required: true
  },
  optionText: {
    type: String,
    required: true
  }
});

const TestResultSchema = new mongoose.Schema({
  id: {
    type: String,
    required: true
  },
  userId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },
  completedAt: {
    type: Date,
    required: true
  },
  areaScores: {
    type: Map,
    of: Number,
    required: true
  },
  topAreas: [{
    type: String,
    required: true
  }],
  responses: [QuestionResponseSchema],
  summary: {
    type: String,
    required: true
  }
}, {
  timestamps: true
});

// Índices para melhor performance
TestResultSchema.index({ userId: 1, completedAt: -1 });
TestResultSchema.index({ id: 1 }); // Para buscar por ID único do teste

module.exports = mongoose.model('TestResult', TestResultSchema);