defmodule Basic do
  def q1 do
    "data.json"
    |> File.stream!
    |> Enum.map(fn d -> Poison.decode!(d) end)
    |> Enum.filter(fn d -> d["age"] <= 20 end)
    |> Enum.count
  end

  def q2_1 do
    "data.json"
    |> File.stream!
    |> Stream.map(fn d -> Poison.decode!(d) end)
    |> Stream.filter(fn d -> d["age"] <= 20 end)
    |> Enum.count
  end

  def q2_2 do
    "data.json"
    |> File.stream!
    |> Flow.from_enumerable(stages: 2)
    |> Flow.map(fn d -> Poison.decode!(d) end)
    |> Flow.filter(fn d -> d["age"] <= 20 end)
    |> Enum.count
  end

  def q2_3 do
    "data.json"
    |> File.stream!
    |> Flow.from_enumerable(stages: 4)
    |> Flow.map(fn d -> Poison.decode!(d) end)
    |> Flow.filter(fn d -> d["age"] <= 20 end)
    |> Enum.count
  end

  def q2_4 do
    "data.json"
    |> File.stream!
    |> Flow.from_enumerable(stages: 8)
    |> Flow.map(fn d -> Poison.decode!(d) end)
    |> Flow.filter(fn d -> d["age"] <= 20 end)
    |> Enum.count
  end
end
