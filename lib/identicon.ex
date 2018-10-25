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
  end

  def hash_input(input) do
    # :binary.bin_to_list(:crypto.hash(:md5, input))
    hex =
      :crypto.hash(:md5, input)
      |> :binary.bin_to_list()

    %Identicon.Image{hex: hex}
  end

  def save(_binary, _filename) do
  end
end
