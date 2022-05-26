defmodule Identicon do
  @moduledoc """
    Provides methods for generating identicons
  """

  @doc """
    Main method
  """
  def generate(string) do
    hex_list =
      string
      |> hash

    color =
      hex_list
      |> pick_color

    pixel_map =
      hex_list
      |> build_grid
      |> filter_odds
      |> build_pixel_map
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

  @doc """
    Builds a 5x5 grid map from `list`

  ## Examples
      iex> Identicon.hash("hello world") |> Identicon.build_grid
      [
      {94, 0},    {182, 1},   {59, 2},    {182, 3},   {94, 4},
      {187, 5},   {224, 6},   {30, 7},    {224, 8},   {187, 9},
      {238, 10},  {208, 11},  {147, 12},  {208, 13},  {238, 14},
      {203, 15},  {34, 16},   {187, 17},  {34, 18},   {203, 19},
      {143, 20},  {90, 21},   {205, 22},  {90, 23},   {143, 24}
      ]
  """
  def build_grid(list) do
    list
    |> Enum.chunk(3)
    |> Enum.map(&mirror_row/1)
    |> List.flatten
    |> Enum.with_index
  end


  @doc """
    Helper function to create symmetric rows

  ## Examples
      iex> [1, 2, 3, 4, 5] |> Identicon.mirror_row
      [1, 2, 3, 4, 5, 4, 3, 2, 1]
  """
  def mirror_row(row) do
    {head, tail} = Enum.split(row, length(row) - 1)
    head ++ tail ++ Enum.reverse(head)
  end


  @doc """
    Removes the odd values from grid

  ## Examples
      iex> Identicon.hash("hello world") |> Identicon.build_grid |> Identicon.filter_odds
      [
      {94, 0},    {182, 1},               {182, 3},   {94, 4},
                  {224, 6},   {30, 7},    {224, 8},
      {238, 10},  {208, 11},              {208, 13},  {238, 14},
                  {34, 16},               {34, 18},
                  {90, 21},               {90, 23}
      ]
  """
  def filter_odds(grid) do
    grid
    |> Enum.filter fn({value, _index}) ->
      rem(value, 2) == 0
    end
  end


  @doc """
    Calculates the corners of pixels according to given `grid`

  ## Examples
      iex> Identicon.hash("hello world") |> Identicon.build_grid |> Identicon.filter_odds |> Identicon.build_pixel_map
      [
        {{0, 0}, {50, 50}},
        {{50, 0}, {100, 50}},
        {{150, 0}, {200, 50}},
        {{200, 0}, {250, 50}},
        {{50, 50}, {100, 100}},
        {{100, 50}, {150, 100}},
        {{150, 50}, {200, 100}},
        {{0, 100}, {50, 150}},
        {{50, 100}, {100, 150}},
        {{150, 100}, {200, 150}},
        {{200, 100}, {250, 150}},
        {{50, 150}, {100, 200}},
        {{150, 150}, {200, 200}},
        {{50, 200}, {100, 250}},
        {{150, 200}, {200, 250}}
      ]
  """
  def build_pixel_map(grid) do
    grid
    |> Enum.map fn({_value, index}) ->
      horizontal = rem(index, 5) * 50
      vertical = div(index, 5) * 50

      top_left = {horizontal, vertical}
      bottom_right = {horizontal + 50, vertical + 50}

      {top_left, bottom_right}
    end
  end
end
