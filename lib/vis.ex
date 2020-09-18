alias Graphvix.{Graph, Node, Edge, Cluster}

defmodule Vis do
  def main([input]),
   do: to_graphviz(input |> parse)
   |> IO.puts

  def to_graphviz(list),
    do: _to_graphviz(Graph.new(), nil, list)
    |> Graph.to_dot()

  def _to_graphviz(graph, _, nil), do: graph
  def _to_graphviz(graph, parent_node, [x, l, r]) do
    {graph, node} = Graph.add_vertex(graph, x)
    {graph, _} = Graph.add_edge(graph, node, parent_node)
    graph = _to_graphviz(graph, node, l)
    graph = _to_graphviz(graph, node, r)
    graph
  end

  @spec parse(binary) :: list
  def parse(str) do
    {:ok, tokens, _} = str |> to_charlist() |> :list_lexer.string()
    {:ok, list} = :list_parser.parse(tokens)
    list
  end
end
