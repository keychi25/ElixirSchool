defmodule ElixirSchool.Function do
  @moduledoc false

  sum = fn(a, b) -> a + b end
  IO.puts sum.(2, 3)

  sum1 =  &(&1 + &2)

  IO.puts sum1.(2, 3)

  handle_result = fn
    {:ok, result} -> IO.puts "Handling result ..."
    {:ok, _} -> IO.puts "This would be never run as previous will be matched beforehand."
    {:error} -> IO.puts "An error has occurred!"
  end

  some_result = 1
  handle_result.({:ok, some_result})
  handle_result.({:error})

  def hello(name) do
    "Hello, " <> name
  end

  defmodule Length do
    def of([]), do: 0
    def of([_ | tail]), do: 1 + of(tail)
  end

  defmodule Greeter do
    def hello(name), do: phrase() <> name
    defp phrase, do: "Hello, " #プライベート関数
  end


  IO.puts Length.of []
  IO.puts Length.of [1, 2, 3]

  defmodule Greeter1 do
    def hello(%{name: person_name}) do
      IO.puts "Hello, " <> person_name
    end
  end

  defmodule Greeter2 do
    def hello(), do: "Hello, anonymous person!"   # hello/0
    def hello(name), do: "Hello, " <> name        # hello/1
    def hello(name1, name2), do: "Hello, #{name1} and #{name2}"
    # hello/2
  end

  IO.puts Greeter2.hello()
  IO.puts Greeter2.hello("Fred")
  IO.puts Greeter2.hello("Fred", "Jane")

  fred = %{name: "Fred", age: 95, favorite_color: "Taupe"}
  person = %{name: "Fred", age: "95", favorite_color: "Taupe"}
  # %{name: person_name} = %{name: "Fred", age: "95", favorite_color: "Taupe"}
  IO.puts Greeter1.hello(fred)


  defmodule Greeter4 do
    def hello(%{name: person_name} = person) do
      IO.puts "Hello, " <> person_name
      IO.inspect person
    end
  end

  Greeter4.hello(%{name: "Fred"})

  defmodule Greeter3 do
    def hello(person = %{name: person_name}) do
      IO.puts "Hello, " <> person_name
      IO.inspect person
    end
  end

  Greeter3.hello(fred)

  # ガード
  defmodule Gard do
    def hello(names) when is_list(names) do
      names
      |> Enum.join(", ")
      |> hello
    end

    def hello(name) when is_binary(name) do
      phrase() <> name
    end

    defp phrase, do: "Hello, "

    def hello(name, language_code \\ "en") do
      phrase(language_code) <> name
    end

    defp phrase("en"), do: "Hello, "
    defp phrase("es"), do: "Hola, "
  end

  IO.puts Gard.hello ["Sean", "Steve"]
  IO.puts Gard.hello("Sean") #引数の2つめが指定されていないので, 自動的にデフォルト引数の"en"が入力されたことになる

  defmodule Gard2 do
    def hello(names, language_code \\ "en")

    def hello(names, language_code) when is_list(names) do
      names
      |> Enum.join(", ")
      |> hello(language_code)
    end

    def hello(name, language_code) when is_binary(name) do
      phrase(language_code) <> name
    end

    defp phrase("en"), do: "Hello, "
    defp phrase("es"), do: "Hola, "
  end

  IO.puts Gard2.hello ["Sean", "Steve"]
  IO.puts Gard2.hello ["Sean", "Steve"], "es"
end

IO.puts ElixirSchool.Function.hello("Sean")

