defmodule Snap do

  def snap() do

    camera = Camera.default({800, 600})

    obj1 = %Sphere{radius: 140, pos: {0, 0, 700}, color: {:rgb, 0, 255, 0}}
    obj2 = %Sphere{radius: 50, pos: {200, 0, 600}, color: {:rgb, 255, 0, 0}}
    obj3 = %Sphere{radius: 50, pos: {-80, 0, 400}, color: {:rgb, 0, 0, 255}}

    image = Tracer.tracer(camera, [obj1, obj2, obj3])
    PNG.write("imag2.png", image)
  end

end
