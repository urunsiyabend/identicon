defmodule Identicon do
  @moduledoc """
    Provides methods for generating identicons
  """

  @doc """
    Main method
  """
  def generate(string) do
    hex_list = string |> hash
  end

  @doc """
    Generates a list of numbers
    It hashes the `string` with md5 algorithm so this list is unique

  ## Examples
      iex> Identicon.hash "hello world"
      [94, 182, 59, 187, 224, 30, 238, 208, 147, 203, 34, 187, 143, 90, 205, 195]
  """
  def hash(string) do
    :crypto.hash(:md5, string)
    |> :binary.bin_to_list
  end

  @doc """
    Picks the first three values of `hex list` as tuple that stands for RGB scale

  ## Examples
      iex> Identicon.hash("hello world") |> Identicon.pick_color
      {94, 182, 59}
  """
  def pick_color([r, g, b | _tail]) do
    {r, g, b}
  end
end
