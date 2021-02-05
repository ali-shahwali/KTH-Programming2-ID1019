defmodule Eager do

  def eval_expr({:atm, id}, _) do {:ok, id} end

  def eval_expr({:var, id}, env) do
    case Env.lookup(id, env) do
      nil ->
        :error
      {_, str} ->
        {:ok, str}
    end
  end

  def eval_expr({:cons, e1, e2}, env) do
    case eval_expr(e1, env) do
      :error ->
        :error
      {:ok, s1} ->
        case eval_expr(e2, env) do
          :error ->
            :error
          {:ok, s2} ->
            {:ok, {s1, s2}}
        end
    end
  end
end
