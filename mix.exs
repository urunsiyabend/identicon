defmodule Identicon.MixProject do
  use Mix.Project

  def project do
    [
      app: :identicon,
      version: "0.1.0",
      elixir: ">= 1.17.0 and < 1.19.0",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :crypto],
      mod: {Identicon.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:mime, "~> 2.0", override: true},
      {:plug_crypto, "~> 1.2", override: true},
      {:telemetry, "~> 1.2", override: true},
      {:plug, "~> 1.15", override: true},
      {:cowboy, "~> 2.10", override: true},
      {:cowboy_telemetry, "~> 0.4", override: true},
      {:plug_cowboy, "~> 2.6", override: true},
      {:phoenix, "~> 1.7.10"},
      {:phoenix_pubsub, "~> 2.1"},
      {:phoenix_html, "~> 3.3"},
      {:phoenix_live_view, "~> 0.19.5"},
      {:esbuild, "~> 0.7", runtime: Mix.env() == :dev},
      {:tailwind, "~> 0.1.10", runtime: Mix.env() == :dev},
      {:floki, git: "https://github.com/philss/floki", tag: "v0.35.3", only: :test}
    ]
  end
end
