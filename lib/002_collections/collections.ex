defmodule Collections do
  @moduledoc """
  Documentation for `Collections`.
  """

  @doc """
  Using Elixir Collections.

  ## Examples

      iex> Collections.lists()
      iex> Collections.tuples()
      iex> Collections.keyword_lists()
      iex> Collections.maps()

  """
  def lists do
    list = [3.14, :pie, "Apple"]
    IO.inspect list, label: "The list is"

    # Prepending (faster)
    list = ["π" | list]
    IO.inspect list, label: "The list is"

    # Appending
    list = list ++ ["Cherry"]
    IO.inspect list, label: "The list is"

    list = [1, 2] ++ [3, 4, 1]
    IO.inspect list, label: "The list is"

    list = ["foo", :bar, 42] -- [42, "bar"]
    IO.inspect list, label: "The list is"

    # Note: lists sub uses strict comparation for match values. Example:
    # iex> [2] -- [2.0]
    # [2]
    # iex> [2.0] -- [2.0]
    # []

    list_head = hd [3.14, :pie, "Apple"]
    IO.inspect list_head, label: "The list head is"

    list_tail = tl [3.14, :pie, "Apple"]
    IO.inspect list_tail, label: "The list tail is"

    [head | tail] = [3.14, :pie, "Apple"]
    IO.inspect head, label: "The list head is"
    IO.inspect tail, label: "The list tail is"
  end

  def tuples do
    my_tuple = {3.14, :pie, "Apple"}
    IO.inspect my_tuple
    # It's used for addictional function returns

    File.read("path/to/unknown/file")
  end

  def keyword_lists do
    # Keyword lists and maps are the associative collections of Elixir.
    # In Elixir, a keyword list is a special list of two-element tuples whose
    # first element is an atom; they share performance with lists:
  
    [foo: "bar", hello: "world"]
    |> IO.inspect

    [{:foo, "bar"}, {:hello, "world"}]
    |> IO.inspect

    # Keys are atoms.
    # Keys are ordered.
    # Keys do not have to be unique.
    # Keyword lists are most commonly used to pass options to functions.
  end

  def maps do
    map = %{:foo => "bar", "hello" => :world}
    IO.puts map[:foo]
    IO.puts map["hello"]

    new_key = "my_key"
    map = %{:foo => "bar", "hello" => :world, new_key => "my_value"}
    map = Map.put(map, :other_key, "bazz")
    IO.inspect map

    # As we can see from the output above, there is a special syntax
    # for maps containing only atom keys:
    IO.puts %{foo: "bar", hello: "world"} === %{:foo => "bar", :hello => "world"}

    # In addition, there is a special syntax for accessing atom keys:
    map = %{foo: "bar", hello: "world"}
    IO.puts map.hello
  end
end
