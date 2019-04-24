defmodule Pipeline do
  @moduledoc false

  # パイプライン演算子は結果を左に取りそれを右側に渡す.
  IO.inspect "Elixir rocks" |> String.split()
  IO.inspect "Elixir rocks" |> String.upcase() |> String.split()
  IO.puts "elixir" |> String.ends_with?("ixir")

end
