defmodule JuizoNeural do
  use Application

  def start(_type, _args) do
    # Correção final: parse com match em {:ok, result}
    ".env"
    |> File.read!()
    |> Dotenvy.Parser.parse()
    |> case do
         {:ok, vars} ->
           Enum.each(vars, fn {key, val} -> System.put_env(key, val) end)

         {:error, reason} ->
           IO.puts("❌ Falha ao carregar .env: #{inspect(reason)}")
       end

    children = [
      {Plug.Cowboy, scheme: :http, plug: JuizoNeural.Server, options: [port: 4000]}
    ]

    IO.puts("🚀 Servidor Juízo Neural rodando em http://localhost:4000")

    Supervisor.start_link(children, strategy: :one_for_one, name: JuizoNeural.Supervisor)
  end
end
