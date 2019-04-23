defmodule ElixirSchool.Basis do
  @moduledoc false

 def sum(x, y) do
   IO.puts x + y
  end

  sum = fn (x, y) ->
    IO.puts x + y
  end
   sum.(2, 3)

  atom = fn () ->
    IO.puts true |> is_atom
    IO.puts :true |> is_boolean
    IO.puts :true === true

  end
  atom.()

  logic = fn () ->
    IO.puts -20 || true
    IO.puts false || 42

    IO.puts 42 && true
    IO.puts 42 && nil

    IO.puts !42
    IO.puts !false
  end
  logic.()

  # ソートされる順序
  # number < atom < reference < function < port < pid < tuple < map < list < bitstring

  # 文字列の式展開
  string = fn (name)->
    IO.puts "Hello #{name} !!"
  end
  string.(Elixir)

  # 文字列の連結
  link = fn (name) ->
   IO.puts  "Hello " <> name
  end
  link.("elixir")
  link.("phoenix")
end