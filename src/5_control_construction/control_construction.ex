defmodule ElixirSchool.ControlConstruction do
  @moduledoc false
  import Integer

  if String.valid?(2) do
    IO.puts "Valid string!"
  else
    IO.puts "Invalid string."
  end

  if "a string value" do
    IO.puts "Truthy"
  end

  unless is_integer("hello") do
    IO.puts "Not an Int"
  end

  case {:ok, "Hello World"} do
    {:ok, result} -> IO.puts result
    {:error,} -> IO.puts "Un oh!"
    _-> IO.puts "Catch all"
  end

  case :even do
    :odd -> IO.puts "Odd"
    _ -> IO.puts "Not Odd!"
  end

  pie = 3.14
  case "cherry pie" do
    ^pie -> IO.puts "Not so tasty"
    pie -> IO.puts "I get #{pie} is tasty"
  end

  case {1, 2, 3} do
    {1, x, 3 } when x > 0 -> IO.puts "Will match"
    _ -> IO.puts "Won't match"
  end

  cond do
    2 + 2 == 5 -> IO.puts "This will not be true"
    2 * 2 == 3 -> IO.puts "Nor this"
    1 + 1 == 2 -> IO.puts "But this will"
  end

  cond do
    7 + 1 == 0 -> IO.puts "Incorrect"
    true -> IO.puts "Catch all"
  end

  user = %{first: "Sean", last: "Callan"}
  with {:ok, first} <- Map.fetch(user, :first),
       {:ok, last} <- Map.fetch(user, :last),
       do: last <> ", " <> first

  m = %{a: 1, c: 3}

  a =
    with {:ok, number} <- Map.fetch(m, :a),
         true <- is_even(number) do
      IO.puts "#{number} divided by 2 is #{div(number, 2)}"
      :even
    else
      :error ->
        IO.puts("We don't have this item in map")
        :error

      _ ->
        IO.puts("It is odd")
        :odd
    end
end
