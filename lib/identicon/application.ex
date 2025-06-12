defmodule Identicon.Application do
  use Application

  def start(_type, _args) do
    children = [
      IdenticonWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Identicon.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
