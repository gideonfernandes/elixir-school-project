defmodule AnonymousFunctions do
  @moduledoc """
  Documentation for `AnonymousFunctions`.
    The Enum module includes over 70 functions for working with enumerables.
    All the collections that we learned about in the previous lesson,
    with the exception of tuples, are enumerables.

  """

  @doc """
  Using Elixir AnonymousFunctions.

  ## Examples

      iex> AnonymousFunctions.basic()
      iex> AnonymousFunctions.case()
      iex> AnonymousFunctions.cond()
      iex> AnonymousFunctions.with()

  """

  def basic do
    sum = fn (a, b) -> a + b end
    IO.puts sum.(10, 15)

    sum = &(&1 + &2)
    IO.puts sum.(20, 25)
  end
end
