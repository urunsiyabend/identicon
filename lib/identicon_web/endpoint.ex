defmodule IdenticonWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :identicon

  socket "/live", Phoenix.LiveView.Socket

  plug Plug.Static,
    at: "/",
    from: :identicon,
    gzip: false,
    only: ~w(assets)

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Session,
    store: :cookie,
    key: "_identicon_key",
    signing_salt: "signsalt"

  plug IdenticonWeb.Router
end
