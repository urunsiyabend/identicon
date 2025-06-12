import Config

config :identicon, IdenticonWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [formats: [html: IdenticonWeb.ErrorHTML], layout: false],
  pubsub_server: Identicon.PubSub,
  live_view: [signing_salt: "signsalt"]

config :esbuild,
  version: "0.7.0",
  default: [
    args: ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :tailwind,
  version: "3.3.3",
  default: [
    args: ~w(--config=tailwind.config.js --input=css/app.css --output=../priv/static/assets/app.css),
    cd: Path.expand("../assets", __DIR__)
  ]

import_config "#{config_env()}.exs"
