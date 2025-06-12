defmodule IdenticonWeb.Router do
  use Plug.Router
  use Plug.ErrorHandler

  plug :match
  plug :fetch_query_params
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "<html><body><form action='/preview' method='get'><input name='username'/><button>Generate</button></form></body></html>")
  end

  get "/preview" do
    case conn.params["username"] do
      nil -> send_resp(conn, 400, "username required")
      "" -> send_resp(conn, 400, "username required")
      username ->
        body = "<html><body><img src='/identicon/#{username}' /><br/><a href='/identicon/#{username}?download=1'>Download</a></body></html>"
        send_resp(conn, 200, body)
    end
  end

  get "/identicon/:username" do
    svg = Identicon.image_svg(username)
    conn = put_resp_content_type(conn, "image/svg+xml")
    conn = if conn.params["download"] do
      put_resp_header(conn, "content-disposition", "attachment; filename=#{username}.svg")
    else
      conn
    end
    send_resp(conn, 200, svg)
  end

  match _ do
    send_resp(conn, 404, "not found")
  end

  def handle_errors(conn, _info) do
    send_resp(conn, conn.status, "error")
  end
end
