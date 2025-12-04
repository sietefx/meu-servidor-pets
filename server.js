const express = require('express');
const mysql = require('mysql2');
require('dotenv').config();
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());

// Conexão MySQL
const connection = mysql.createConnection({
  host: process.env.DB_HOST || 'localhost',
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_NAME || 'pet_care_db'
});

// Testar conexão
connection.connect((err) => {
  if (err) {
    console.log('❌ Erro MySQL:', err.message);
  } else {
    console.log('✅ Conectado ao MySQL!');
  }
});

// Rota de teste
app.get('/', (req, res) => {
  res.json({ 
    message: 'API de Pets funcionando! 🐾',
    status: 'online',
    endpoints: ['/tutores', '/pets', '/eventos']
  });
});

// Rota para tutores
app.get('/tutores', (req, res) => {
  connection.query('SELECT * FROM Tutor', (err, results) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.json(results);
    }
  });
});

app.post('/tutores', (req, res) => {
  const { nome, email, telefone, senha_hash } = req.body;
  const sql = 'INSERT INTO Tutor (nome, email, telefone, senha_hash) VALUES (?, ?, ?, ?)';
  
  connection.query(sql, [nome, email, telefone, senha_hash], (err, result) => {
    if (err) {
      res.status(500).json({ error: err.message });
    } else {
      res.status(201).json({ 
        message: 'Tutor criado!',
        id: result.insertId 
      });
    }
  });
});

// Iniciar servidor
app.listen(PORT, () => {
  console.log(`🚀 Servidor rodando em http://localhost:${PORT}`);
});
