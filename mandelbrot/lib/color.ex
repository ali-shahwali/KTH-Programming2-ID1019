defmodule Color do

  def convert(depth, max) do
    color_1(depth, max)
  end

  def color_1(depth, max) do

    range = 5*depth/max

    prop = trunc(255*(depth/max))

    cond do
      range <= 1 ->
        {:rgb, 255, 255, 255-prop}

      range > 1 and range <= 2 ->
        {:rgb, 255 - prop, 0, 0}

      range > 2 and range <= 3 ->
        {:rgb, 0, prop, 0}

      range > 3 and range <= 4 ->
        {:rgb, 0, 255, prop}

      true ->
        {:rgb, 255, 255-prop, 255}
    end
  end

  def red(d, max) do
    f = d / max

    # a is [0 - 4.0]
    a = f * 4

    # x is [0,1,2,3,4]
    x = trunc(a)

    # y is [0 - 255]
    y = trunc(255 * (a - x))

    case x do
      0 ->
        # black -> red
        {:rgb, y, 0, 0}

      1 ->
        # red -> yellow
        {:rgb, 255, y, 0}

      2 ->
        # yellow -> green
        {:rgb, 255 - y, 255, 0}

      3 ->
        # green -> cyan
        {:rgb, 0, 255, y}

      4 ->
        # cyan -> blue
        {:rgb, 0, 255 - y, 255}
    end
  end

end
