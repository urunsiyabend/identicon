defmodule IdenticonWeb.Router do
  use IdenticonWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {IdenticonWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", IdenticonWeb do
    pipe_through :browser

    live "/", HomeLive, :index
    get "/identicon/:username", IdenticonController, :show
  end
end
