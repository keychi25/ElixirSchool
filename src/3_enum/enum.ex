defmodule ElixirSchool.Enum do
  @moduledoc false

  ## all?
  IO.puts Enum.all?(["foo", "bar", "hello"], fn(s) -> String.length(s) == 3 end)
  IO.puts Enum.all?(["foo", "bar", "hello"], fn(s) -> String.length(s) >= 3 end)

  # any?
  IO.puts Enum.any?(["foo", "bar", "hello"], fn(s) -> String.length(s) == 3 end)

  # chunk_every
  IO.inspect Enum.chunk_every([1, 2, 3, 4, 5, 6], 2)

  # chunk_by
  IO.inspect Enum.chunk_by(["one", "two", "three", "four", "five"], fn(x) -> String.length(x) end)

  # map_every
  IO.inspect Enum.map_every([1, 2, 3, 4, 5, 6, 7, 8], 3, fn x -> x + 1000 end)

  # each
  Enum.each(["one", "two", "three"], fn(s) -> IO.puts(s) end)

  # map
  IO.inspect Enum.map([0, 1, 2, 3], fn(x) -> x - 1 end)

  # min
  IO.puts Enum.min([5, 3, 0, -1])

  # max
  IO.puts Enum.max([5, 3, 0, -1])

  # filter
  IO.inspect Enum.filter([1, 2, 3, 4], fn(x) -> rem(x, 2) == 0 end)

  # reduce
  # コレクションをまとめ単一の値を出す
  IO.puts Enum.reduce([1, 2, 3], 10, fn(x, acc) -> x + acc end)

  # sort
  IO.inspect Enum.sort([5, 6, 1, 3, -1, 4])

  # uniq_by(重複を取り除く)
  IO.inspect Enum.uniq_by([1, 2, 3, 2, 1, 1, 1, 1, 1], fn x -> x end)
end
