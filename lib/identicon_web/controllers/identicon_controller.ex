defmodule IdenticonWeb.IdenticonController do
  use IdenticonWeb, :controller

  def show(conn, %{"username" => username} = params) do
    svg = Identicon.image_svg(username)
    conn = put_resp_content_type(conn, "image/svg+xml")

    conn = if params["download"] do
      put_resp_header(conn, "content-disposition", "attachment; filename=#{username}.svg")
    else
      conn
    end

    send_resp(conn, 200, svg)
  end
end
