#---
# Title        : Assignment - 1,
# Subject      : Distributed And Operating Systems Principles
# Team Members : Priyam Saikia, Noopur R K
# File name    : boss.ex
#---

defmodule Boss do
  @moduledoc """
  This module follows the supervisor behaviour. The model emulates the Boss behavior,
  by spawning actor/processes and by assigning required tasks.
  """
  use Supervisor
  def start_link([max_limit,times]) do
    module_size =
    if max_limit < 1500 do
      _module_size = max_limit
    else
      _module_size = 1500
    end
    no_of_divisions = div(max_limit,module_size)
    list_module = Enum.map(1..no_of_divisions,fn x -> x * module_size end)
    list_module ++ [max_limit]
    Enum.map(list_module,fn x -> Supervisor.start_link(__MODULE__,[x,times]) end)
  end

  def init([upper_limit,times]) do
    Process.flag(:trap_exit, :true)
    begin =
    if upper_limit > 1500 do
      chunck_size = 1500
      if rem(upper_limit,chunck_size) > 0 do
        _begin = upper_limit - rem(upper_limit,chunck_size) + 1
      else
        _begin = upper_limit - chunck_size + 1
      end
    else
      _begin = 1
    end

    result_limit = Enum.to_list(begin..upper_limit)
    children = Enum.map(result_limit, fn(limit_num) ->
      worker(Worker, [[limit_num,times]], [id: limit_num, restart: :transient])
    end)

    supervise(children, strategy: :one_for_one)
  end
end
