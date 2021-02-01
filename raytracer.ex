defmodule Vector do

  def scalar({x1, x2, x3}, s) do {s*x1, s*x2, s*x3} end

  def subtract({x1, x2, x3}, {y1, y2, y3}) do {x1 - y1, x2 - y2, x3 - y3} end

  def add({x1, x2, x3}, {y1, y2, y3}) do {x1 + y1, x2 + y2, x3 + y3} end

  def norm({x1, x2, x3}) do :math.sqrt(x1*x1 + x2*x2 + x3*x3) end

  def dotprod({x1, x2, x3}, {y1, y2, y3}) do x1*y1 + x2*y2 + x3*y3 end

  def normalise({x1, x2, x3}) do {x1/norm({x1, x2, x3}), x2/norm({x1, x2, x3}), x3/norm({x1, x2, x3})} end

end

defmodule Ray do

  defstruct pos: {0, 0, 0}, dir: {1, 1, 1}

end

defprotocol Body do

  def intersect(object, ray)

end

defimpl Body do

  def intersect(sphere = %Sphere{}, ray = %Ray{}) do

  end

end

defmodule Sphere do

  defstruct pos: {0, 0, 0}, radius: 2

end
