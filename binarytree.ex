defmodule Binarytree do

  #### checks if element is in binary tree
  ## checks leafs
  def member(_, :nil) do :no end
  def member(elem, {:leaf, elem}) do :yes end
  def member(_, {:leaf, _}) do :no end

  ## checks nodes
  def member(elem, {:node, elem, _, _}) do :yes end
  def member(elem, {:node, value, left, right}) do
    cond do
      elem < value -> member(elem, left)
      true -> member(elem, right)
    end
  end

  #### inserts new element in to binary tree
  def insert(elem, :nil) do {:leaf, elem} end
  def insert(elem, {:leaf, v}) do
    cond do
      elem < v -> {:node, v, {:leaf, elem}, :nil}
      true -> {:node, v, :nil, {:leaf, elem}}
    end
  end
  def insert(elem, {:node, v, left, right}) do
    cond do
      elem < v -> {:node, v, insert(elem, left), right}
      true -> {:node, v, left, insert(elem, right)}
    end
  end

  #### deletes element from binary tree (naive solution)
  def delete(elem, {:leaf, elem}) do :nil end
  def delete(elem, {:node, elem, left, :nil}) do left end
  def delete(elem, {:node, elem, :nil, right}) do right end
  def delete(elem, {:node, elem, left, right}) do {:node, getval(right), left, delete(getval(right), right)} end
  def delete(elem, {:node, v, left, right}) do
    cond do
      elem < v -> {:node, v, delete(elem, left), right}
      true -> {:node,  v, left, delete(elem, right)}
    end
  end

  #### returns value of leaf or node
  def getval({:leaf, val}) do val end
  def getval({:node, val, _, _}) do val end
end
