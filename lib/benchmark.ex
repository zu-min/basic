defmodule Benchmark do
  def timed_flow(stage) do
    :timer.tc(fn ->
      1..100000000
      |> Flow.from_enumerable(stages: stage)
      |> Flow.map(& &1 * 2)
      |> Enum.to_list end)
      |> elem(0)
      |> Kernel./(1000000)
  end

  def timed_flow2 do
    :timer.tc(fn ->
      1..100000000
      |> Flow.from_enumerable
      |> Flow.map(& &1 * 2)
      |> Enum.to_list end)
      |> elem(0)
      |> Kernel./(1000000)
  end

  def timed_enum() do
      :timer.tc( fn ->
        1..100000000
        |> Enum.to_list
        |> Enum.map(& &1 * 2 ) end )
        |> elem(0)
        |> Kernel./(1000000)
    end
end
