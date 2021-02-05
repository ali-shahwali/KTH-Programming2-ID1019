defmodule Env do

  #### creates new empty environment
  def new() do [] end

  #### adds new binding to given environment
  def add(id, str, env) do
    [{id, str}|env]
  end

  #### looks up what id is bound to in the given environment
  def lookup(id, env) do
    List.keyfind(env, id, 0)
  end

  #### removes all bindings from given list in given environment
  def remove([], env) do env end
  def remove([id|t], env) do
    remove(t, List.keydelete(env, id, 0))
  end
end
