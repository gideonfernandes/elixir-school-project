defmodule ElixirSchoolProjectTest do
  use ExUnit.Case
  doctest ElixirSchoolProject

  test "greets the world" do
    assert ElixirSchoolProject.hello() == :world
  end
end
