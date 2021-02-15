defmodule Test do

  def sum(l) do
    f = fn(h, a) -> h + a end
    foldr(l, 0, f)
  end

  def prod(l) do
    f = fn(h, a) -> h * a end
    foldr(l, 1, f)
  end

  def length(l) do
    f = fn(_, a) -> a + 1 end
    foldr(l, 0, f)
  end

  def revr(l) do
    f = fn(h,a) -> a ++ [h] end
    foldr(l, [], f)
  end
  def revl(l) do
    f = fn(h,a) -> [h] ++ a end
    foldl(l, [], f)
  end

  def foldr([], acc, _op) do acc end
  def foldr([h|t], acc, op) do
    op.(h, foldr(t, acc, op))
  end

  def foldl([], acc, _op) do acc end
  def foldl([h|t], acc, op) do
    foldl(t, op.(h, acc), op)
  end

  def sumrange(range) do
    reduce(range, 0, fn(x, a) -> {:cont, a + x} end)
  end

  def take(range, n) do
    reduce(range, {:cont, {:sofar, 0, []}},
    fn(x, {:sofar, s, acc}) ->
      if s == n do
        {:halt, acc}
      else
        {:cont, {:sofar, s+1, [x|acc]}}
      end
    end)
  end

  def reduce({:range, from, to}, {:cont, acc}, fun) do
    if from <= to do
      reduce({:range, from + 1, to}, fun.(from, acc), fun)
    else
      {:done, acc}
    end
  end
  def reduce(_, {:halt, acc}, _fun) do {:halted, acc} end
end
