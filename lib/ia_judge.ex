defmodule IaJudge do
  # Juiz 1: LLaMA 3.3 via OpenRouter
  def enviar_pergunta(:ia1, pergunta) do
    body =
      %{
        model: "meta-llama/llama-3.3-8b-instruct:free",
        messages: [%{role: "user", content: pergunta}]
      }
      |> Jason.encode!()

    headers = [
      {"Authorization", "Bearer #{System.get_env("LLAMA_KEY")}"},
      {"Content-Type", "application/json"},
      {"HTTP-Referer", "http://localhost"},
      {"X-Title", "Juizo Neural"}
    ]

    url = "https://openrouter.ai/api/v1/chat/completions"

    case HTTPoison.post(url, body, headers, timeout: 10_000, recv_timeout: 15_000) do
      {:ok, response} ->
        %{"choices" => [primeiro | _]} = Jason.decode!(response.body)
        primeiro["message"]["content"]

      {:error, error} ->
        "Erro ao chamar LLaMA (Juiz 1): #{inspect(error)}"
    end
  end


  # Juiz 2: DeepSeek
  def enviar_pergunta(:ia2, pergunta) do
    body =
      %{
        model: "deepseek/deepseek-r1-0528-qwen3-8b:free",
        messages: [%{role: "user", content: pergunta}]
      }
      |> Jason.encode!()

    headers = [
      {"Authorization", "Bearer #{System.get_env("DEEP_SEEK")}"},
      {"Content-Type", "application/json"},
      {"HTTP-Referer", "http://localhost"},
      {"X-Title", "Juizo Neural"}
    ]

    url = "https://openrouter.ai/api/v1/chat/completions"

    case HTTPoison.post(url, body, headers, timeout: 10_000, recv_timeout: 15_000) do
      {:ok, response} ->
        %{"choices" => [primeiro | _]} = Jason.decode!(response.body)
        primeiro["message"]["content"]

      {:error, error} ->
        "Erro ao chamar DeepSeek (Juiz 2): #{inspect(error)}"
    end
  end
end
