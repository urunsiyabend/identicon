import Config

config :identicon, IdenticonWeb.Endpoint,
  http: [port: 4002],
  server: false

config :logger, level: :warning
