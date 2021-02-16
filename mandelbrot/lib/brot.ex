defmodule Brot do

  def mandelbrot(c, iterations) do
    z0 = Complex.new(0, 0)
    i = 0
    test(i, z0, c, iterations)
  end

  def test(iterations, _, _, iterations) do 0 end
  def test(i, zn, c, iterations) do
    cond do
      Complex.abs(zn) > 2 ->
        i
      true ->
        test(i + 1, Complex.add(Complex.sqr(zn), c), c, iterations)
    end
  end

end
