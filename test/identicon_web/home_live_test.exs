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

  test "submit generates preview" do
    {:ok, view, _html} = live(build_conn(), "/")
    form = element(view, "form")
    render_submit(form, %{"username" => "alice"})
    assert has_element?(view, "img[src='/identicon/alice']")
  end
end
