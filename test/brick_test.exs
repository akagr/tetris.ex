defmodule BrickTest do
  use ExUnit.Case
  doctest Tetris.Brick

  import Tetris.Brick

  test "creates a new brick" do
    assert new().name == :o
  end

  test "creates a new random brick" do
    brick = new_random()

    assert brick.name in [:i, :l, :z, :o, :t]
    assert brick.reflection in [true, false]
    assert brick.rotation in [0, 90, 180, 270]
  end
end
