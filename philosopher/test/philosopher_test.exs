defmodule PhilosopherTest do
  use ExUnit.Case
  doctest Philosopher

  test "greets the world" do
    assert Philosopher.hello() == :world
  end
end
