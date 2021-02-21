defmodule EnumFunctions do
  @moduledoc """
  Documentation for `EnumFunctions`.
    The Enum module includes over 70 functions for working with enumerables.
    All the collections that we learned about in the previous lesson,
    with the exception of tuples, are enumerables.

  """

  @doc """
  Using Elixir EnumFunctions.

  ## Examples

      iex> EnumFunctions.all()
      iex> EnumFunctions.any()
      iex> EnumFunctions.chunk_every()
      iex> EnumFunctions.chunk_by()
      iex> EnumFunctions.map_every()
      iex> EnumFunctions.each()
      iex> EnumFunctions.map()
      iex> EnumFunctions.min_and_max()
      iex> EnumFunctions.filter()
      iex> EnumFunctions.reducer()
      iex> EnumFunctions.sort()
      iex> EnumFunctions.uniqs()
      iex> EnumFunctions.capture_operator()

  """

  def all do
    Enum.all?(["foo", "bar", "hello"], fn(s) -> String.length(s) == 3 end)
    |> IO.puts # false

    Enum.all?(["foo", "bar", "hello"], fn(s) -> String.length(s) > 1 end)
    |> IO.puts # true
  end

  def any do
    Enum.any?(["foo", "bar", "hello"], fn(s) -> String.length(s) == 5 end)
    |> IO.puts # true
  end

  def chunk_every do
    Enum.chunk_every([1, 2, 3, 4, 5, 6], 2)
  end

  def chunk_by do
    my_list = ["one", "two", "three", "four", "five"]
    Enum.chunk_by(my_list, fn(x) -> String.length(x) end)
  end

  def map_every do
    # Apply function every three items
    Enum.map_every([1, 2, 3, 4, 5, 6, 7, 8], 3, fn x -> x + 1000 end)
  end

  def each do
    Enum.each(["one", "two", "three"], fn(item) -> IO.puts(item) end)
  end

  def map do
    Enum.map([1, 2, 3, 4, 5], fn(item) -> item * 10 end)
  end

  def min_and_max do
    IO.inspect Enum.min([5, 3, 0, -1])
    IO.inspect Enum.max([5, 3, 0, -1])
  end

  def filter do
    Enum.filter([1, 3, 70, 7, 15, 22], fn(number) -> rem(number, 2) === 0 end)
  end

  def reduce do
    IO.inspect Enum.reduce([1, 2, 3], fn(x, acc) -> x + acc end)
    IO.inspect Enum.reduce(["a","b","c"], "1", fn(x,acc)-> x <> acc end)

    Enum.reduce([1, 4, 8, 10], 100, fn(current, acc) -> current + acc end)
  end

  def sort do
    Enum.sort([5, 6, 1, 3, -1, 4])
    # [-1, 1, 3, 4, 5, 6]

    Enum.sort([:foo, "bar", Enum, -1, 4])
    # [-1, 4, Enum, :foo, "bar"]

    # with our function
    Enum.sort([%{:val => 4}, %{:val => 1}], fn(x, y) -> x[:val] > y[:val] end)
    # [%{val: 4}, %{val: 1}]

    # without
    Enum.sort([%{:count => 4}, %{:count => 1}])
    # [%{count: 1}, %{count: 4}]

    Enum.sort([2, 3, 1], :desc)
    # [3, 2, 1]
  end

  def uniqs do
    Enum.uniq([1, 2, 3, 2, 1, 1, 1, 1, 1])
    # [1, 2, 3]

    Enum.uniq_by(
      [%{x: 1, y: 1}, %{x: 2, y: 1}, %{x: 3, y: 3}], fn coord -> coord.y end
    )
    # [%{x: 1, y: 1}, %{x: 3, y: 3}]
  end

  defmodule Adding do
    def plus_three(number), do: number + 3
  end

  def capture_operator do
    IO.inspect Enum.map([1, 2, 3], fn(number) -> number * 2 end)
    IO.inspect Enum.map([1, 2, 3], &(&1 * 2))
    times_three = &(&1 * 3)
    IO.inspect Enum.map([1, 2, 3, 4], times_three)

    IO.inspect Enum.map([1, 2, 3, 4], fn number -> Adding.plus_three(number) end)
    IO.inspect Enum.map([1, 2, 3, 4], &Adding.plus_three(&1))
    IO.inspect Enum.map([1, 2, 3, 4], &Adding.plus_three/1)
  end
end
