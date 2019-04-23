defmodule ElixirSchool.Collections do
  @moduledoc false

  # リスト
  list = [3.14, :pie, "Apple"]
  IO.puts "<リストの表示>"
  Enum.map(list, &IO.puts(&1))
  # 先頭に追加(高速)
  add_head_list = fn (current, head)->
     new = [head] ++ current
     IO.puts "<先頭に追加>"
     Enum.map(new, &IO.puts(&1))
  end
  add_head_list.(list, "Π")
  # 末尾に追加(低速)
  add_tail_list = fn (current, tail)->
    new = [tail] ++ current
    IO.puts " <末尾に追加>"
    Enum.map(new, &IO.puts(&1))
  end
  add_tail_list.(list, "円周率")
  # リストの連結
  add_list = [1, 2] ++ [3, 4, 1]
  IO.puts "<リストの連結>"
  Enum.map(add_list, &IO.puts(&1))
  # リストの減算
  sub_list = ["foo",:bar, 42] -- [42, "bar"]
  IO.puts "<リストの減算>"
  Enum.map(sub_list, &IO.puts(&1))
  # 重複した値の減算
  # 右辺の要素のそれぞれに対し, 左辺の要素のうち初めて登場した同じ値が順次削除される
  sub2_list = [1,2,2,3,2,3] -- [1,2,3,2]
  IO.puts "<リストの減算(重複)>"
  Enum.map(sub2_list, &IO.puts(&1))
  # 先頭の取得
  IO.puts "<リストの先頭>"
  IO.puts hd list
  IO.inspect tl list

  # タプル
  # 関数から補助的な情報を返す仕組み
  tuple = {3.14, :pie, "Apple"}
  IO.inspect tuple

  # キーワードリスト
  # 最初の要素がアトムのタプルからなる特別なリスト
  key = [foo: "bar", hello: "world!"] # key = [{:foo, "bar"}, {:hello, "world!"}]
  IO.inspect key

  # マップ
  map = %{:foo => "bar", :hello => "world!"}
  IO.inspect map
  IO.puts map[:foo]
  IO.puts map.foo
  IO.puts map[:hello]
  IO.puts map.hello

  IO.puts %{foo: "bar", hello: "world"} == %{:foo => "bar", :hello => "world"}

  # マップの更新
  map = %{map | foo: "baz"}
  IO.inspect map

end