defmodule ElixirSchool.PatternMatching do
  @moduledoc false

  a = 1
  IO.puts a
  x = 1
  {x, ^x} = {2, 1}
  IO.puts x
  key = "hello"
  %{^key => value} = %{"hello" => "world"}
  IO.puts value
end
