defmodule Chopstick do

  def start do
    stick = spawn_link(fn -> available() end)
    {:stick, stick}
  end

  def available() do
    receive do
      {:request, from} ->
        send(from, :granted)
        gone()
      :quit ->
        :ok
    end
  end

  def gone() do
    receive do
      :return ->
        available()
      :quit ->
        :ok
    end
  end

  def request(stick) do

  end
end
