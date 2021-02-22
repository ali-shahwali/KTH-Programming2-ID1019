defmodule Ray do

  defstruct(pos: {0, 0, 0}, dir: {1, 1, 1})

  def ray(camera, col, row) do
    x = Vector.scalar(camera.right, col)
    y = Vector.scalar(camera.down, row)
    v = Vector.add(x, y)
    p = Vector.add(camera.corner, v)
    dir = Vector.normalise(p)
    %Ray{pos: camera.pos, dir: dir}
  end
end
