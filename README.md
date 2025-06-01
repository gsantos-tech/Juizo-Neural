# ⚖️ Juízo Neural

**Juízo Neural** é um sistema de Inteligência Artificial construído para simular julgamentos jurídicos, utilizando múltiplos agentes autônomos com raciocínio argumentativo. Desenvolvido como Trabalho 2 da disciplina de Inteligência Artificial – Sistemas de Informação (AMF, 2025/01), o projeto explora uma arquitetura avançada com múltiplas IAs colaborando e competindo entre si.

---

## 🧠 Visão Geral

O sistema processa **casos jurídicos simulados** e realiza uma análise automática em três etapas:

1. **IA Defensora**: um advogado virtual responde com base na legislação brasileira.
2. **IA Acusadora**: um promotor virtual argumenta contra o réu com fundamentos legais.
3. **IA Avaliadora (Juiz)**: uma terceira IA imparcial analisa ambas as peças e decide qual argumento é mais fundamentado.

---

## 🚀 Tecnologias Utilizadas

| Tecnologia | Função |
|------------|--------|
| **Elixir + Plug** | Backend leve e concorrente para processamento das requisições |
| **HTTPoison** | Requisições HTTP para as APIs das IAs |
| **Jason** | Conversão de dados JSON |
| **OpenRouter API** | Acesso a modelos como Microsoft Phi-4 e DeepSeek |
| **Google Gemini API** | Avaliação dos argumentos por IA imparcial (juiz) |

---

## 🧩 Arquitetura

