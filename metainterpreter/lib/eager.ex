defmodule Eager do
  def test() do
    seq = [{:match, {:var, :x}, {:atm,:a}},{:match, {:var, :y}, {:cons, {:var, :x}, {:atm, :b}}},{:match, {:cons, :ignore, {:var, :z}}, {:var, :y}},{:var, :z}]

    eval_seq(seq,[])
  end

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
            {:ok, [s1|s2]}
        end
    end
  end

  def eval_match(:ignore, _, env) do {:ok, env} end
  def eval_match({:atm, id}, id, env) do {:ok, env} end

  def eval_match({:var, id}, str, env) do
    case Env.lookup(id, env) do
      :nil ->
        {:ok, Env.add(id, str, env)}
      {_, ^str} ->
        {:ok, env}
      _ ->
        :fail
    end
  end

  def eval_match({:cons, e1, e2}, [s1|s2], env) do
    case eval_match(e1, s1, env) do
      :fail ->
        :fail
      {:ok, envp} ->
        case eval_match(e2, s2, envp) do
          :fail ->
            :fail
          {:ok, envt} ->
            {:ok, envt}
        end
    end
  end

  def eval_match(_, _, _) do :fail end


  def eval_scope(pattern, env) do
    Env.remove(extract_vars(pattern), env)
  end

  def eval_seq([exp], env) do eval_expr(exp, env) end
  def eval_seq([{:match, pattern, expression}|seqrest], env) do
    case eval_expr(expression, env) do
      :error ->
        :error
      {:ok, str} ->
        envp = eval_scope(pattern, env)
        case eval_match(pattern, str, envp) do
          :fail ->
            :error
          {:ok, envt} ->
            eval_seq(seqrest, envt)
        end
    end
  end


  def extract_vars(pattern) do
    extract_vars(pattern, [])
  end

  def extract_vars({:atm, _}, vars) do vars end
  def extract_vars({:var, id}, vars) do [id|vars] end
  def extract_vars(:ignore, vars) do vars end
  def extract_vars({:cons, e1, e2}, vars) do
    extract_vars(e1, extract_vars(e2, vars))
  end

end
