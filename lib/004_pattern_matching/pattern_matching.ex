defmodule PatternMatching do
  @moduledoc """
  Documentation for `PatternMatching`.
    The Enum module includes over 70 functions for working with enumerables.
    All the collections that we learned about in the previous lesson,
    with the exception of tuples, are enumerables.

  """

  @doc """
  Using Elixir PatternMatching.

  ## Examples

      iex> PatternMatching.match_operator()
      iex> PatternMatching.pin_operator()

  """

  def match_operator do
    x = 1
    # 1
    1 = x
    # 1
    # 2 = x
    # ** (MatchError) no match of right hand side value: 1

    list = [1, 2, 3]
    # [1, 2, 3]
    [1, 2, 3] = list
    # [1, 2, 3]
    # [] = list
    # ** (MatchError) no match of right hand side value: [1, 2, 3]
    [1 | tail] = list
    # [1, 2, 3]
    tail
    [2, 3]
    # [2 | _] = list
    # ** (MatchError) no match of right hand side value: [1, 2, 3]

    {:ok, value} = {:ok, "Successful!"}
    # {:ok, "Successful!"}
    value
    # "Successful!"
    # {:ok, value} = {:error}
    # ** (MatchError) no match of right hand side value: {:error}
  end

  def pin_operator do
    x = 1
    # 1
    # ^x = 2
    # ** (MatchError) no match of right hand side value: 2
    {x, ^x} = {2, 1}
    # {2, 1}
    x
    # 2
    
    key = "hello"
    # "hello"
    %{^key => value} = %{"hello" => "world"}
    # %{"hello" => "world"}
    value
    # "world"
    # %{^key => value} = %{:hello => "world"}
    # ** (MatchError) no match of right hand side value: %{hello: "world"}
    greeting = "Hello"
    # "Hello"
    # greet = fn
    # ...>   (^greeting, name) -> "Hi #{name}"
    # ...>   (greeting, name) -> "#{greeting}, #{name}"
    # ...> end
    # # Function<12.54118792/2 in :erl_eval.expr/5>
    # greet.("Hello", "Sean")
    # # "Hi Sean"
    # greet.("Mornin'", "Sean")
    # # "Mornin', Sean"
    greeting
    # "Hello"
  end
end
