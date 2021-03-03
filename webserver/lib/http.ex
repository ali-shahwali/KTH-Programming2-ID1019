defmodule HTTP do

  def parse_rq(rq0) do
    {request, rq1} = request_line(rq0)
    {headers, rq2} = headers(rq1)
    {body, _} = message_body(rq2)

    {request, headers, body}
  end

  defp request_line([?G, ?E, ?T, 32 | r0]) do
    {uri, r1} = request_uri(r0)
    {ver, r2} = http_version(r1)
    [13, 10 | r3] = r2

    {{:get, uri, ver}, r3}
  end

  defp request_uri([32 | r0]) do {[], r0} end
  defp request_uri([c | r0]) do
    {rest, r1} = request_uri(r0)
    {[c | rest], r1}
  end

  defp http_version([72, 84, 84, 80, 47, 49, 46, 49 | r0]) do
    {:v11, r0}
  end
  defp http_version([72, 84, 84, 80, 47, 49, 46, 48 | r0]) do
    {:v10, r0}
  end


  defp headers([13, 10 | r0]) do {[], r0} end
  defp headers(r0) do
    {header, r1} = header(r0)
    {rest, r2} = headers(r1)
    {[header | rest], r2}
  end
  defp header([13, 10 | r0]) do {[], r0} end
  defp header([c | r0]) do
    {rest, r1} = header(r0)
    {[c | rest], r1}
  end

  defp message_body(r) do {r, []} end

  def ok(body) do
    "HTTP/1.1 200 OK\r\n\r\n #{body}"
  end

  def get(uri) do
    "GET #{uri} HTTP/1.1\r\n\r\n"
  end

end
