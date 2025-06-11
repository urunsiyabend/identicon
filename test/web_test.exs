defmodule IdenticonWebTest do
  use ExUnit.Case, async: true
  use Plug.Test

  alias IdenticonWeb.Router

  test "GET / returns form" do
    conn = conn(:get, "/") |> Router.call([])
    assert conn.status == 200
    assert conn.resp_body =~ "form"
  end

  test "GET /preview shows identicon" do
    conn = conn(:get, "/preview?username=test") |> Router.call([])
    assert conn.status == 200
    assert conn.resp_body =~ "<img"
  end

  test "GET /preview without username returns 400" do
    conn = conn(:get, "/preview") |> Router.call([])
    assert conn.status == 400
  end

  test "GET /identicon/test returns image" do
    conn = conn(:get, "/identicon/test") |> Router.call([])
    assert conn.status == 200
    assert String.starts_with?(Enum.at(get_resp_header(conn, "content-type"), 0), "image/svg+xml")
    assert conn.resp_body =~ "<svg"
  end
end
