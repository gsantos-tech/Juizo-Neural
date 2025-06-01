defmodule IaEvaluator do
  def avaliar(%{caso: caso, defesa: defesa, acusacao: acusacao}) do
    prompt = """
    Você é um juiz imparcial e ético responsável por avaliar duas peças jurídicas apresentadas para o mesmo caso criminal. Uma representa a defesa e a outra a acusação. Leia com atenção ambos os argumentos, considerando coerência, fundamentação jurídica (Código Penal, Constituição Federal, jurisprudência e doutrina) e clareza técnica.

    Responda de forma objetiva:

    1. Qual dos dois argumentos está melhor estruturado e fundamentado juridicamente?
    2. Por quê?
    3. Qual seria seu parecer final com base nas peças apresentadas?

    Responda em tom jurídico, claro, técnico e sem repetir os textos originais.

    Caso:
    #{caso}

    Defesa:
    #{defesa}

    Acusação:
    #{acusacao}
    """

    body =
      %{
        contents: [%{parts: [%{text: prompt}]}]
      }
      |> Jason.encode!()

    headers = [
      {"Content-Type", "application/json"}
    ]

    url =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=#{System.get_env("GEMINI_API_KEY")}"

    case HTTPoison.post(url, body, headers, timeout: 15_000, recv_timeout: 20_000) do
      {:ok, response} ->
        %{"candidates" => [primeiro | _]} = Jason.decode!(response.body)
        primeiro["content"]["parts"]
        |> List.first()
        |> Map.get("text")

      {:error, error} ->
        "Erro ao chamar Gemini (Avaliador): #{inspect(error)}"
    end
  end
end
