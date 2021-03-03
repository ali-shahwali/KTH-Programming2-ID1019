defmodule Server do

  def start(port) do
    Process.register(spawn(fn -> init(port) end), :server)
  end

  def stop() do
    Process.exit(Process.whereis(:server), "Time to die!")
  end



  def init(port) do
    options = [:list, active: false, reuseaddr: true]
    case :gen_tcp.listen(port, options) do
      {:ok, listenSocket} ->
        handler(listenSocket)
        :gen_tcp.close(listenSocket)
        :ok
      {:error, error} ->
        error
    end
  end

  def handler(listenSocket) do
    case :gen_tcp.accept(listenSocket) do
      {:ok, socket} ->
        request(socket)
        :gen_tcp.close(socket)
        handler(listenSocket)
      {:error, error} ->
        error
    end
  end

  def request(socket) do
    recv = :gen_tcp.recv(socket, 0)
    case recv do
      {:ok, packet} ->
         request = HTTP.parse_rq(packet)
         response = reply(request)
         :gen_tcp.send(socket, response)
      {:error, error} ->
        error
    end
  end

  def reply(request) do
    HTTP.ok("Hello")
  end
end
