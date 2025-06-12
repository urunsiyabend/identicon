defmodule IdenticonWebTest do
  use ExUnit.Case, async: true
  use Phoenix.ConnTest

  @endpoint IdenticonWeb.Endpoint

  test "GET / returns form" do
    conn = get(build_conn(), "/")
    assert conn.status == 200
    assert conn.resp_body =~ "form"
  end

  test "GET /identicon/test returns image" do
    conn = get(build_conn(), "/identicon/test")
    assert conn.status == 200
    assert String.starts_with?(Enum.at(get_resp_header(conn, "content-type"), 0), "image/svg+xml")
    assert conn.resp_body =~ "<svg"
  end
end
