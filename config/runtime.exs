import Config

if config_env() == :prod do
  config :identicon, IdenticonWeb.Endpoint, server: true
end
