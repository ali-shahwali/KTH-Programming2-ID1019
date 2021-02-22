defmodule Sphere do

  defstruct pos: {0, 0, 0}, radius: 2, color: {:rgb, 255, 255, 255}

  defimpl Object do
    def intersect(sphere, ray) do
      k = Vector.subtract(sphere.pos, ray.pos)
      a = Vector.dotprod(ray.dir, k)
      asqr = a*a
      ksqr = Vector.norm(k)*Vector.norm(k)
      rsqr = sphere.radius*sphere.radius
      tsqr = asqr - ksqr + rsqr
      closest(tsqr, a)
    end

    def closest(tsqr, a) do
      cond do
        tsqr < 0 ->
          :no
        true ->
          d1 = a + :math.sqrt(tsqr)
          d2 = a - :math.sqrt(tsqr)
          cond do
            d1 < 0 and d2 < 0 ->
              :no
            d1 < 0 or d2 < 0 ->
              :no
            true ->
              {:ok, Enum.min([d1, d2])}
          end
      end
    end

    def normal(sphere, _, pos) do
      Vector.normalise(Vector.subtract(pos, sphere.pos))
    end

  end


end
