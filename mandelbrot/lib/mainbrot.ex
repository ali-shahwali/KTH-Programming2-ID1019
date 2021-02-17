defmodule Mainbrot do

  def test() do
    paint(-2, 1.2, 0.7)
  end

  def paint(x0, y0, xn) do
    width = 1440
    heigth = 1080
    depth = 256
    k = (xn - x0)/width
    image = Mandel.mandelbrot(width, heigth, x0, y0, k, depth)
    PNG.write("mandelbrot4.png", image)
  end
end
