defmodule Gtgcrawler.MixProject do
  use Mix.Project

  def project do
    [
      app: :gtgcrawler,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Gtgcrawler.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:crawly, "~> 0.16"},
      {:floki, "~> 0.36"},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false}
    ]
  end
end
