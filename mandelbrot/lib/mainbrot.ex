defmodule Mainbrot do

  def test() do
    paint(-2.2, 1, 1)
  end

  def paint(x0, y0, xn) do
    width = 1920
    heigth = 1080
    depth = 64
    k = (xn - x0)/width
    image = Mandel.mandelbrot(width, heigth, x0, y0, k, depth)
    PNG.write("mandelbrot.png", image)
  end
end
