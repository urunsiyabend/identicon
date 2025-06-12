defmodule IdenticonWeb.RouterTest do
  use ExUnit.Case, async: true
  use Phoenix.ConnTest

  @endpoint IdenticonWeb.Endpoint

  test "GET /identicon/test returns image" do
    conn = get(build_conn(), "/identicon/test")
    assert conn.status == 200
    assert List.first(get_resp_header(conn, "content-type")) =~ "image/svg+xml"
    assert conn.resp_body =~ "<svg"
  end

  test "GET /identicon/test?download=1 sets disposition" do
    conn = get(build_conn(), "/identicon/test?download=1")
    assert List.first(get_resp_header(conn, "content-disposition")) =~ "attachment"
  end
end
