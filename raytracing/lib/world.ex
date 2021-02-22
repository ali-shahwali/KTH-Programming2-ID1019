defmodule World do
  @background {:rgb, 0, 0, 0}
  @ambient {:rgb, 80, 80, 80}

  defstruct(objects: [], lights: [], background: @background, ambient: @ambient)

end
