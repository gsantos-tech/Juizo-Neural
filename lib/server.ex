defmodule JuizoNeural.Server do
  use Plug.Router
  require Logger

  plug Plug.Logger
  plug :match

  plug Plug.Parsers,
       parsers: [:json],
       pass: ["application/json"],
       json_decoder: Jason

  plug :dispatch

  post "/perguntar" do
    Logger.info("🔍 Recebida pergunta para julgamento e avaliação.")

    pergunta = conn.body_params["pergunta"] || "Pergunta não fornecida"

    juiz1 =
      try do
        IaJudge.enviar_pergunta(:ia1, pergunta)
      rescue
        e -> "Erro interno com Juiz 1: #{Exception.message(e)}"
      end

    juiz2 =
      try do
        IaJudge.enviar_pergunta(:ia2, pergunta)
      rescue
        e -> "Erro interno com Juiz 2: #{Exception.message(e)}"
      end

    veredito =
      try do
        IaEvaluator.avaliar(%{
          caso: pergunta,
          defesa: juiz1,
          acusacao: juiz2
        })
      rescue
        e -> "Erro interno com o Avaliador: #{Exception.message(e)}"
      end


    resposta = %{
      pergunta: pergunta,
      respostas: [
        %{
          modelo: "microsoft/phi-4-reasoning-plus:free",
          origem: "Juiz 1 (Microsoft Phi-4 via OpenRouter)",
          conteudo: juiz1
        },
        %{
          modelo: "deepseek/deepseek-r1-0528-qwen3-8b:free",
          origem: "Juiz 2 (DeepSeek via OpenRouter)",
          conteudo: juiz2
        }
      ],
      veredito_final: %{
        avaliador: "Gemini 2.0 Pro",
        origem: "Juiz Avaliador",
        conteudo: veredito
      }
    }

    Logger.info("✅ Resposta gerada com sucesso.")
    send_resp(conn, 200, Jason.encode!(resposta))
  end

  match _ do
    send_resp(conn, 404, "Not found")
  end
end
