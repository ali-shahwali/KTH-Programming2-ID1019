defmodule Concurrency do
  def start do
    spawn(fn -> test() end)
  end

  def test() do
    receive do
      :ok ->
        IO.puts("hello world")
        test()
      :quit ->
        :ok
    end
  end

end
