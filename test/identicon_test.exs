defmodule IdenticonTest do
  use ExUnit.Case
  doctest Identicon

  test "image_svg returns svg" do
    data = Identicon.image_svg("test")
    assert String.starts_with?(data, "<svg")
  end

end
