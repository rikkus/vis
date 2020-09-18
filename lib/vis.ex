alias Graphvix.{Graph, Node, Edge, Cluster}

defmodule Vis do
  def main([input]) do
    IO.inspect(parse(input))
  end

  def to_graphviz(list) do


  @spec parse(binary) :: list
  def parse(str) do
    {:ok, tokens, _} = str |> to_charlist() |> :list_lexer.string()
    {:ok, list} = :list_parser.parse(tokens)
    list
  end
end
