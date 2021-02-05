defmodule Introduction do

  ## returns m * n
  def product(m, n) do
    case m do
      0 ->
         0
      _ ->
        product(m - 1, n) + n
    end
  end
  ## returns x^n
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

  #### DOESNT WORK ####
  def expFast(x, 1) do x end
  def expFast(x, n) do
    case rem(trunc(n), 2) do
      0 ->
        expFast(x * x, n/2)
      1 ->
        x * expFast(x * x, (n-1)/2)
    end
  end

  ## returns nth element of list assuming first element has index 1
  def nth(n, [h|t]) do
    case n do
      1 ->
        h
      _ ->
        nth(n - 1, t)
    end
  end

  ## returns length of list
  def len([]) do 0 end
  def len([_|t]) do
    1 + len(t)
  end

  ## returns sum of all elements in list
  def sum([]) do 0 end
  def sum([h|t]) do
    h + sum(t)
  end

  ## duplicates every element in list

  def duplicate(l) do
    cond do
      l == [] ->
        []
      true ->
        [hd(l), hd(l)|duplicate(tl(l))]
    end
  end

  ## adds element x in list if x isnt in list already

  def add(x, l) do
    if x != hd(l) do
      cond do
        tl(l) == [] ->
          [x]
        true ->
          [hd(l)|add(x, tl(l))]
      end
    else
      IO.puts("already in list")
    end
  end

  ## removes all occurences of element x from list
  def remove(x,l) do
    cond do
      l == [] ->
        []
      x == hd(l) ->
        remove(x,tl(l))
      true ->
        [hd(l)|remove(x,tl(l))]
    end
  end

end
