defmodule MetainterpreterTest do
  use ExUnit.Case
  doctest Metainterpreter

  test "greets the world" do
    assert Metainterpreter.hello() == :world
  end
end
