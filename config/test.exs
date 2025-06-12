import Config

config :identicon, IdenticonWeb.Endpoint,
  http: [port: 4002],
  server: false,
  secret_key_base: String.duplicate("a", 64)

config :logger, level: :warning
