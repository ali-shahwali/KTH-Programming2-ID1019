defmodule Philosopher do

  def start do
    philosopher = spawn_link(fn -> )
    {:philosopher, philosopher}
    end
  end

end
