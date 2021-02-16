defmodule Mandel do

  def mandelbrot(width, height, x, y, k, depth) do
    nxtpixl = fn(w, h) -> Complex.new(x + k*(w - 1), y - k*(h - 1)) end

    rows(width, height, depth, nxtpixl, [])
  end

  def rows(_, 0, _, _, image) do image end
  def rows(width, height, depth, nxtpixl, image) do
    row = row(width, height, depth, nxtpixl, [])
    rows(width, height - 1, depth, nxtpixl, [row|image])
  end

  def row(0, _, _, _, row) do row end
  def row(w, h, d, nxtpixel, row) do
    current = nxtpixel.(w, h)
    color = Color.convert(Brot.mandelbrot(current, d), d)
    row(w - 1, h, d, nxtpixel, [color|row])
  end
end
