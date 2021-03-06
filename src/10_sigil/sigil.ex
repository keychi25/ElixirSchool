defmodule Sigil do
  @moduledoc false

  # ~(チルダ)
  """
  ~C エスケープや埋め込みを含まない文字のリストを生成する
  ~c エスケープや埋め込みを含む文字のリストを生成する
  ~R エスケープや埋め込みを含まない正規表現を生成する
  ~r エスケープや埋め込みを含む正規表現を生成する
  ~S エスケープや埋め込みを含まない文字列を生成する
  ~s エスケープや埋め込みを含む文字列を生成する
  ~W エスケープや埋め込みを含まない単語のリストを生成する
  ~w エスケープや埋め込みを含む単語のリストを生成する
  ~N NaiveDateTime 構造体を生成する

  <...> カギ括弧のペア
  {...} 中括弧のペア
  [...] 大括弧のペア
  (...) 小括弧のペア
  |...| パイプ記号のペア
  /.../ スラッシュのペア
  "..." ダブルクォートのペア
  '...' シングルクォートのペア
"""

  # 正規表現
  re = ~r/elixir/ ## iを含める(~r/elixir/i)と大文字・小文字の区別をしない

  IO.puts "Elixir" =~ re #false
  IO.puts "elixir" =~ re #true

  number = "100_000_000"
  IO.inspect Regex.split(~r/_/, number)


end
