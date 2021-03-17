defmodule Exam do

  ### 2020-03-09

  #1
  def toggle([]) do [] end
  def toggle([e1|[]]) do [e1] end
  def toggle([e1, e2|rest]) do
    [e2, e1 | toggle(rest)]
  end

  #2
  def stack() do
    {:stack, []}
  end

  def push({:stack, stack}, element) do
    {:stack, [element|stack]}
  end

  def pop({:stack, []}) do :no end
  def pop({:stack, stack}) do
    {:ok, hd(stack), {:stack, tl(stack)}}
  end

  #3
  def flatten([]) do [] end
  def flatten([head | tail]) do
    flatten(head) ++ flatten(tail)
  end
  def flatten(elem) do [elem] end

  #4
  def index(list) do index(list, 0) end
  def index([h|t], n) when h > n do
      index(t, n + 1)
  end
  def index(_, n) do n end

  #5
  def compact(:nil) do :nil end
  def compact({:leaf, val}) do {:leaf, val} end
  def compact({:node, left, right}) do
    left_leaves = compact(left)
    right_leaves = compact(right)

    compactor(left_leaves, right_leaves)
  end

  def compactor(:nil, {:leaf, val}) do {:leaf, val} end
  def compactor({:leaf, val}, :nil) do {:leaf, val} end
  def compactor({:leaf, val}, {:leaf, val}) do {:leaf, val} end
  def compactor({:node, left, right}) do {:node, left, right} end

  # THE PASCAL QUESTION #

  def pascal(n) do
    calc_pascal([1], n)
  end

  def calc_pascal(current_row, 1) do current_row end
  def calc_pascal([1], n) do calc_pascal([1,1], n-1) end
  def calc_pascal(current_row, n) do
    next_row = calc_nextrow(current_row)
    calc_pascal(next_row, n-1)
  end

  def calc_nextrow([1]) do [1] end
  def calc_nextrow([poll1, poll2|rest]) do
    cond do
      poll1 == 1 and poll2 == [] ->
        [1]
      poll1 == 1 ->
        [1, poll1 + poll2| calc_nextrow([poll2|rest])]
      true ->
        [poll1 + poll2| calc_nextrow([poll2|rest])]
      end
  end


end
