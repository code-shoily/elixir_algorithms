defmodule AlgoTest do
  use ExUnit.Case
  doctest Algo

  test "greets the world" do
    assert Algo.hello() == :world
  end
end
