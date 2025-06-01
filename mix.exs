defmodule JuizoNeural.MixProject do
  use Mix.Project

  def project do
    [
      app: :juizo_neural,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {JuizoNeural, []}
    ]
  end

  defp deps do
    [
      {:plug_cowboy, "~> 2.6"},
      {:plug, "~> 1.15"},
      {:jason, "~> 1.4"},
      {:httpoison, "~> 1.8"},
      {:dotenvy, "~> 0.9"}
    ]
  end
end
