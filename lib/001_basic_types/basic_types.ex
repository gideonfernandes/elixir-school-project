defmodule BasicTypes do
  @moduledoc """
  Documentation for `BasicTypes`.
  """

  @doc """
  Using Basic Elixir Types.

  ## Examples

      iex> BasicTypes.integer()
      iex> BasicTypes.float()
      iex> BasicTypes.boolean()
      iex> BasicTypes.atom()
      iex> BasicTypes.string()
      iex> BasicTypes.aritm()
      iex> BasicTypes.boolean_operators()
      iex> BasicTypes.boolean_comparators()

  """
  def integer do
    IO.puts 255
    IO.puts 0b0110
    IO.puts 0x1F

    # with bin, oct & hex support
  end

  def float do
    IO.puts 3.14
    IO.puts 1.0e-10
  end

  def boolean do
    IO.puts true
    IO.puts false
    IO.puts :true
    IO.puts :false

    # all values is true except false & nil
  end

  def atom do
    IO.puts :foo
    IO.puts :bar
    IO.puts :foo == :bar

    IO.puts is_boolean(:true)
    IO.puts is_atom(true)

    description = "is_atom(ElixirSchoolProject.BasicTypes)"
    "Calling: #{description} #{is_atom(ElixirSchoolProject.BasicTypes)} !"
    |> IO.puts

    :crypto.strong_rand_bytes 3

    # Atoms also is used for Erlang modules reference calls.
  end

  def string do
    IO.puts "Hello"
    IO.puts "dziękuję"
    IO.puts "foo
    ...> bar"
    IO.puts "foo\nbar"

    name = "Sean"
    "Hello #{name}"
    |> IO.puts
    
    "Hello " <> name
    |> IO.puts
  end

  def aritm do
    IO.puts 2 + 2
    IO.puts 2 - 1
    IO.puts 2 * 5
    IO.puts 10 / 5
    IO.puts 2.0

    div(10, 5)
    |> IO.puts

    rem(10, 3)
    |> IO.puts
  end

  def boolean_operators do
    # Any type when: ||, &&, e !

    false || 42
    |> IO.puts

    42 && true
    |> IO.puts

    42 && nil
    |> IO.puts

    !42
    |> IO.puts

    !false
    |> IO.puts

    -20 || true

    # It's mandatory to have first boolean type argument: and, or, not
    # Note: and & or of Elixir are mappeds to andalso & orelse of Erlang.
  end

  def boolean_comparators do
    IO.puts "1 > 2 #{1 > 2} !"
    IO.puts "1 != 2 #{1 != 2} !"
    IO.puts "2 == 2 #{2 == 2} !"
    IO.puts "2 <= 3 #{2 <= 3} !"
    IO.puts "2 == 2.0 #{2 == 2.0} !"
    IO.puts "2 === 2.0 #{2 === 2.0} !"
  end
end
