defmodule Derivative do

  def deriv({:num, _}, _), do  0 end

  def deriv({:var, v}, v), do  1 end

  def deriv({:var, _}, _), do 0 end

  def deriv({:mul, e1, e2}, v), do

  end

  def deriv({:add, e1, e2}, v), do

  end

end
