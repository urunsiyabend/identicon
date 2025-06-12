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
      {:mime, github: "elixir-plug/mime", tag: "v2.0.3", override: true},
      {:plug_crypto, github: "elixir-plug/plug_crypto", tag: "v1.2.5", override: true},
      {:telemetry, github: "beam-telemetry/telemetry", tag: "v1.2.1", override: true},
      {:plug, github: "elixir-plug/plug", tag: "v1.15.3", override: true},
      {:cowboy, github: "ninenines/cowboy", tag: "2.10.0", override: true},
      {:cowboy_telemetry, github: "beam-telemetry/cowboy_telemetry", tag: "v0.4.0", override: true},
      {:plug_cowboy, github: "elixir-plug/plug_cowboy", tag: "v2.6.1", override: true}
    ]
  end
end
