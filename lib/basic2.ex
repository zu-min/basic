defmodule Basic2 do
  def timed_flow(stage) do
    :timer.tc( fn ->
    "data.json"
    |> File.stream!
    |> Flow.from_enumerable(stages: stage) end)
    |> elem(0)
    |> Kernel./(1000000)
    # |> Flow.map(fn d -> Poison.decode!(d) end)
    # |> Flow.filter(fn d -> d["age"] <= 20 end)
    # |> Enum.count
  end
end
