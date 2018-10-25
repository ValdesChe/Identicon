defmodule Identicon do
  @moduledoc """
  Documentation for Identicon.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Identicon.hello()
      :world

  """
  def hello do
    :world
  end

  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
  end

  def build_grid(%Identicon.Image{hex: hex} = _image) do
    hex
    |> Enum.chunk_every(3)
    |> mirror_row
  end

  @doc """
    Mirroring our 3 elements
  ## Examples
      iex> image = [[3 , 2 , 8],[1, 2, 3]]
      iex> Identicon.mirror_row(image)
            [[3 , 2 , 8 , 2 , 3], [1, 2, 3, 2 , 1]]
  """
  def mirror_row(image) do
    for [first, second | _other] = row <- image do
      List.flatten([row | [second, first]])
    end
  end

  def hash_input(input) do
    # :binary.bin_to_list(:crypto.hash(:md5, input))
    hex =
      :crypto.hash(:md5, input)
      |> :binary.bin_to_list()

    %Identicon.Image{hex: hex}
  end

  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
    # [r, g, b]
    %Identicon.Image{image | color: [r, g, b]}
  end

  def save(_binary, _filename) do
  end
end
