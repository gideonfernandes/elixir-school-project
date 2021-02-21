defmodule ControlStructures do
  @moduledoc """
  Documentation for `ControlStructures`.
    The Enum module includes over 70 functions for working with enumerables.
    All the collections that we learned about in the previous lesson,
    with the exception of tuples, are enumerables.

  """

  @doc """
  Using Elixir ControlStructures.

  ## Examples

      iex> ControlStructures.if_and_unless()
      iex> ControlStructures.case()
      iex> ControlStructures.cond()
      iex> ControlStructures.with()

  """

  def if_and_unless do
    if String.valid?("Hello") do
      IO.puts "Valid string!"
    else
      IO.puts "Invalid string."
    end

    if "a string value" do
      IO.puts "Truthy"
    end

    unless is_integer("hello") do
      IO.puts "Not an Int"
    end
  end

  def case do
    case {:ok, "Hello World"} do
      {:ok, result} -> IO.puts result
      {:error} -> IO.puts "Uh Noooh"
      _ -> IO.puts "Catch All"
    end

    pie = 3.14
    case "cherry pie" do
      ^pie -> IO.puts "Not so tasty"
      pie -> IO.puts "I bet #{pie} is tasty"
    end

    case {1, 2, 3} do
      {1, x, 3} when x > 0 ->
        IO.puts "Will match"
      _ ->
        IO.puts "Won't match"
    end
  end

  def cond do
    cond do
      2 + 2 == 5 ->
        IO.puts "This will not be true"
      2 * 2 == 3 ->
        IO.puts "Nor this"
      1 + 1 == 2 ->
        IO.puts "But this will"
      true ->
        IO.puts "Catch All"
    end
  end

  def with do
    import Integer

    m = %{a: 1, c: 3}

    a =
      with {:ok, number} <- Map.fetch(m, :a),
        true <- is_even(number) do
          IO.puts "#{number} divided by 2 is #{div(number, 2)}"
          :even
      else
        :error ->
          IO.puts("We don't have this item in map")
          :error

        _ ->
          IO.puts("It is odd")
          :odd
      end
  end
end
