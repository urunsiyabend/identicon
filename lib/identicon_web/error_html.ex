defmodule IdenticonWeb.ErrorHTML do
  use IdenticonWeb, :html

  def render("404.html", _assigns) do
    "Not Found"
  end

  def render("500.html", _assigns) do
    "Internal Server Error"
  end
end
