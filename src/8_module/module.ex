defmodule ElixirSchool.Module do
  @moduledoc false

  @greeting "Hello"

  def greeting(name) do
    ~s(#{@greeting} #{name}.)
  end

  ## コンポジション
  # alias
  defmodule Sayings.Greetings do
    def basic(name), do: "Hi, #{name}"
  end

  defmodule Example do
    alias Sayings.Greetings

    def greeting(name), do: IO.puts Greetings.basic(name)
  end

  Example.greeting("keychi")

  # import
  # モジュールをaliasするよりも, 関数を取り込みたいという場合に使用
  import List
  IO.puts last([1, 2, 3])

  # require
  # importとの違いは, 関数ではなくマクロを使用可能とする
  defmodule Example1 do
    require Example

    Example.greeting("Furukawa")
  end

  # use
  defmodule Hello do
    defmacro __using__(opts) do
      greeting = Keyword.get(opts, :greeting, "Hi")

      quote do
        def hello(name), do: unquote(greeting) <> ", " <> name
      end
    end
  end

  defmodule Example2 do
    use Hello, greeting: "Hola"
  end
  IO.puts Example2.hello("keychi")

end

IO.puts ElixirSchool.Module.greeting("keychi")