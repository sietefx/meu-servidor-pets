# 🐾 Meu Servidor de Pets

API RESTful para gerenciamento de pets, tutores e eventos de saúde.

## 🚀 Tecnologias
- Node.js
- Express
- MySQL
- MySQL Workbench

## 📦 Instalação

\`\`\`bash
# Clone o repositório
git clone https://github.com/seu-usuario/meu-servidor-pets.git

# Entre na pasta
cd meu-servidor-pets

# Instale as dependências
npm install

# Configure o ambiente
cp .env.example .env
# Edite o .env com suas configurações

# Execute o servidor
npm run dev
\`\`\`

## 🔧 Configuração do Banco

1. Abra o MySQL Workbench
2. Execute o script \`database.sql\`
3. Configure as credenciais no arquivo \`.env\`

## 📚 Rotas da API

### Tutores
- \`GET /tutores\` - Lista todos tutores
- \`POST /tutores\` - Cria novo tutor

### Pets
- \`GET /pets\` - Lista pets
- \`POST /pets\` - Cria novo pet

## 🗄️ Estrutura do Banco

- **Tutor** (1) → (*) **Pet** (1) → (*) **Evento_de_Saude**
  - Evento_de_Saude (1) → (*) **Documento**
  - Evento_de_Saude (1) → (*) **Lembrete**
- **Tutor** → **Compartilhamento** ← **Pet**

## 👤 Autor
Gabriel Felix

## 📄 Licença
MIT
