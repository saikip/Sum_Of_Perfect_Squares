#---
# Title        : Assignment - 1,
# Subject      : Distributed And Operating Systems Principles
# Team Members : Priyam Saikia, Noopur R K
# File name    : worker.ex
#---

defmodule Worker do
  @moduledoc """
  The main resposibility of this module is to emulate the worker behaviour.
  The worker is resposible for computing whetehr the sum of the squares for
  an interval is a perfect sqaure or not.
  """
  import :math

  @spec start_link([...]) :: {:ok, any()}
  def start_link([index,times]) do
    pid = spawn_link(__MODULE__, :init, [[index,times]])
    {:ok, pid}
  end

  @spec init([integer(), ...]) :: nil | :ok
  def init([upper_limit,times]) do
    perfect_sqaure_calc(upper_limit,times)
  end

  @doc """
  This function is responsible for computing of the
  sum of squares for an interval is a perfect
  square or not.
  """
  @spec perfect_sqaure_calc(integer(), integer()) :: any()
  def perfect_sqaure_calc(index,no_of_terms) do

    num = Enum.map(index..no_of_terms + index - 1, fn x -> x * x end)

    sum_of_squares = Enum.sum(num)
    sqrt_num = sqrt(sum_of_squares)
    diff = sqrt_num - Float.floor(sqrt_num)
    if(diff == 0.0) do
      IO.puts("Answer : #{index}")
    end
  end
end
