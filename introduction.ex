defmodule Introduction do

  # returns m * n
  def product(m, n) do
    case m do
      0 ->
         0
      _ ->
        product(m - 1, n) + n
    end
  end
  # returns x^n
  def exp(x, n) do
    case n do
      0 ->
        1
      1 ->
        x
      _ ->
        product(x, exp(x, n-1))
    end
  end

  ## DOESNT WORK
  def expFast(x, 1) do x end
  def expFast(x, n) do
    case rem(trunc(n), 2) do
      0 ->
        expFast(x * x, n/2)
      1 ->
        x * expFast(x * x, (n-1)/2)
    end
  end

  # returns nth element of list assuming first element has index 1
  def nth(n, [h|t]) do
    case n do
      1 ->
        h
      _ ->
        nth(n - 1, t)
    end
  end

  # returns length of list
  def len([]) do 0 end
  def len([_|t]) do
    1 + len(t)
  end

  # returns sum of all elements in list
  def sum([]) do 0 end
  def sum([h|t]) do
    h + sum(t)
  end

  # duplicates every element in list
  def duplicate([], acc) do acc end
  def duplicate([h|t], acc) do
    duplicate(t, acc ++ [h, h])
  end

  # adds element x in list if x isnt in list already
  def add(x, [], acc) do acc ++ x end
  def add(x, [h|t], acc) do
    if x != h do
      add(x, t, acc ++ [h])
    else
    IO.puts("x is in list already")
    end
  end

  # removes all occurences of element x from list
  def remove(_, [], acc) do acc end
  def remove(x, [h|t], acc) do
    if x == h do
      remove(x, t, acc)
    else
      remove(x, t, acc ++ [h])
    end
  end

end
