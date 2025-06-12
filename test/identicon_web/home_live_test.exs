defmodule IdenticonWeb.HomeLiveTest do
  use ExUnit.Case, async: true
  use Phoenix.ConnTest
  import Phoenix.LiveViewTest

  @endpoint IdenticonWeb.Endpoint

  test "displays form" do
    {:ok, view, _html} = live(build_conn(), "/")
    assert has_element?(view, "form")
  end

  test "shareable url loads preview" do
    {:ok, view, _html} = live(build_conn(), "/?u=bob")
    assert has_element?(view, "img")
  end
end
