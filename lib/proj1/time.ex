#---
# Title        : Assignment - 1,
# Subject      : Distributed And Operating Systems Principles
# Team Members : Priyam Saikia, Noopur R K
# File name    : time.ex
#---

defmodule GetTime do
  @moduledoc """
  The main resposibility of this module is to calculate the time taken by a certain actor/process.
  This module can be used as a utility as well.
  """

  @doc """
  Function measures the time taken for a actor/process to complete its task.
  """
  def measure(function) do
    function
    |> :timer.tc
    |> elem(0)
    |> Kernel./(1_000_000)
  end
end
