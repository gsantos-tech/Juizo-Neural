# ⚖️ Juízo Neural

**Juízo Neural** é um sistema de Inteligência Artificial multiagente desenvolvido para simular julgamentos jurídicos, com o objetivo de avaliar argumentações entre defesa e acusação utilizando modelos de linguagem natural (LLMs) e um avaliador imparcial. Este projeto foi criado como **Trabalho 2 da disciplina de Inteligência Artificial (2025/01)** no curso de Sistemas de Informação da **Faculdade Antonio Meneghetti**.

---

## 🧠 Objetivo

O sistema recebe um caso jurídico hipotético como entrada e gera:

1. **Resposta do Juiz 1 (Defensor)** – Utiliza o modelo LLaMA 3.3
2. **Resposta do Juiz 2 (Acusador)** – Utiliza o modelo DeepSeek
3. **Veredito Final do Juiz Avaliador** – Utiliza o modelo Gemini Pro

O veredito final compara tecnicamente os dois argumentos e decide qual é o mais consistente juridicamente.

---

## 🧩 Paradigmas de IA Utilizados

| Paradigma | Aplicação no Projeto |
|----------|----------------------|
| **Simbolismo** | Estrutura dos prompts com lógica jurídica e regras |
| **Conexionismo** | Uso de modelos LLM para gerar raciocínio em linguagem natural |
| **Multiagente** | Três IAs atuam de forma colaborativa e competitiva |
| **Raciocínio Argumentativo** | As respostas são avaliadas com base em coerência e fundamentos |

---

## 🚀 Tecnologias Utilizadas

| Ferramenta | Função |
|------------|--------|
| **Elixir (Plug)** | Backend assíncrono e leve |
| **HTTPoison** | Requisições HTTP para as IAs |
| **Jason** | Codificação e decodificação JSON |
| **OpenRouter API** | Acesso aos modelos Phi-4 e DeepSeek |
| **Google Gemini API** | Veredito final por IA Avaliadora |
| **dotenv** | Gerenciamento de chaves de API sensíveis |

---

## 📁 Estrutura de Diretórios

```
juizo_neural/
├── lib/
│   ├── server.ex             # Servidor HTTP com endpoint /perguntar
│   ├── ia_judge.ex           # IAs de Defesa e Acusação (Phi-4 e DeepSeek)
│   └── ia_evaluator.ex       # Avaliador (Gemini)
├── config/
│   └── config.exs
├── .env                      # Chaves da API (não subir no GitHub)
├── mix.exs                   # Arquivo de configuração do projeto Elixir
└── README.md                 # Este documento
```

---

## 🧪 Como Executar

### 1. Requisitos

- Elixir ≥ 1.14
- Conta nas APIs abaixo:
  - [OpenRouter.ai](https://openrouter.ai/)
  - [Google AI Studio](https://makersuite.google.com/app)

### 2. Clonar o projeto

```bash
git clone https://github.com/seu-usuario/juizo-neural.git
cd juizo-neural
```

### 3. Criar arquivo `.env`

Crie um arquivo `.env` e preencha com suas chaves:

```env
PHI_KEY=sua-chave-openrouter-phi
DEEP_SEEK=sua-chave-openrouter-deepseek
GEMINI_API_KEY=sua-chave-gemini
```

> ⚠️ **IMPORTANTE**: Nunca envie sua `.env` para o GitHub!

### 4. Instalar dependências

```bash
mix deps.get
```

### 5. Rodar o servidor

```bash
mix run --no-halt
```

Servidor disponível em: [http://localhost:4000](http://localhost:4000)

---

## 📡 Endpoint

### `POST /perguntar`

**Descrição**: Envia um caso hipotético e retorna defesa, acusação e veredito final.

**Exemplo de Corpo da Requisição**:

```json
{
  "pergunta": "João foi acusado de furtar um celular. Ele alega que encontrou no chão fora da loja. Como a defesa e acusação devem argumentar?"
}
```

**Exemplo de Resposta JSON**:

```json
{
  "pergunta": "...",
  "respostas": [
    {
      "modelo": "meta-llama/llama-3.3-8b-instruct:free",
      "origem": "Juiz 1 (Defesa)",
      "conteudo": "..."
    },
    {
      "modelo": "deepseek/deepseek-r1-0528-qwen3-8b:free",
      "origem": "Juiz 2 (Acusação)",
      "conteudo": "..."
    }
  ],
  "veredito_final": {
    "avaliador": "Gemini 2.0 Pro",
    "origem": "Juiz Avaliador",
    "conteudo": "..."
  }
}
```

---

## 📊 Casos de Teste Utilizados

- **Furto Simples com Justificativa** – João e o celular fora da loja
- **Cleptomania** – Maria alega transtorno psiquiátrico
- **Legítima Defesa** – Cenários com agressão e reação proporcional
- **Perda de objeto em espaço público** – Debates sobre posse e apropriação

---

## 💡 Funcionalidades Futuras

- 🌐 **Frontend Web** em React, com interface amigável e histórico de casos
- 📝 Upload de casos jurídicos via PDF ou DOCX
- 📊 Painel de estatísticas de vereditos
- 🧠 Vários avaliadores IA e votação majoritária
- 🛡️ Validação de veredictos com bases legais reais
- 🧾 Exportação de casos como relatório

---

## ✅ Status Atual

- [x] Backend funcional com Elixir + Plug
- [x] Conexão com 3 modelos IA distintos
- [x] Lógica de julgamento e avaliação automática
- [x] Suporte a prompts em português
- [x] Pronto para integração com frontend

---

## 📚 Referências Acadêmicas

- Código Penal Brasileiro
- Constituição Federal
- Doutrina Jurídica e Jurisprudência
- Modelos de linguagem baseados em LLMs (OpenRouter, Gemini)

---

## 👨‍🏫 Autoria

Desenvolvido por **Gabriel**  
Curso: **Sistemas de Informação**  
Instituição: **Faculdade Antonio Meneghetti (AMF)**  
Disciplina: **Inteligência Artificial – 2025/01**  

---

## ⚠️ Aviso

Este projeto é estritamente **acadêmico**. As decisões tomadas pelas IAs não têm validade legal.  
**Não deve ser usado em processos jurídicos reais.**

---

## 📄 Licença

Distribuído sob a Licença MIT para fins acadêmicos.  
Uso comercial e jurídico proibido.
