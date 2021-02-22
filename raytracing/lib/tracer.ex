defmodule Tracer do

  @black {:rgb, 0, 0, 0}
  @white {:rgb, 255, 255, 255}
  @delta 0.01

  def tracer(camera, world) do
    {w, h} = camera.size
    for y <- 1..h do
      for x <- 1..w do
        trace(x, y, camera, world)
      end
    end
  end

  def trace(x, y, camera, world) do
    ray = Ray.ray(camera, x, y)
    trace(ray, world)
  end
  def trace(ray, %World{objects: objects}=world) do
    case intersect(ray, objects) do
      {:inf, _} ->
        world.background
      {d, object} ->
        v_i = Vector.add(ray.pos, Vector.scalar(ray.dir, d - @delta))
        v_normal = Object.normal(object, ray, v_i)
        visible = visible(v_i, world.lights, objects)
        illumination = Light.combine(v_i, v_normal, visible)
        Light.illuminate(object, illumination, world)
    end
  end

  defp visible(point, lights, objs) do
    Enum.filter(lights, fn light -> clear(point, light.pos, objs) end)
  end

  defp clear(point, origin, objs) do
    dir = Vector.normalise(Vector.subtract(origin, point))

    List.foldl(objs, true, fn (obj, acc) ->
      case acc do
        false ->
          false

        true ->
          case Object.intersect(obj, %Ray{pos: point, dir: dir}) do
            :no ->
              true

            _ ->
              false
          end
      end
    end)
  end

  def intersect(ray, objects) do
    List.foldl(objects, {:inf, nil},
    fn(object, sofar) ->
      {dist, _} = sofar
      case Object.intersect(object, ray) do
        {:ok, d} when d < dist ->
          {d, object}
        _ ->
          sofar
      end
    end)
  end
end
