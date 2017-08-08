defmodule QuadTreeTest do
  use ExUnit.Case
  require Logger
  doctest QuadTree

  test "Clear" do
    # %QuadTree{ rectangle: %Rectangle{ width: 1000, height: 1000 }} |> QuadTree.clear
  end

  test "Insert" do
    quadtree = QuadTree.create(width: 500, height: 500)

    objects = [
      [ x: 120, y: 114, width: 50, height: 25 ],
      [ x: 335, y: 142, width: 50, height: 25 ],
      [ x: 307, y: 307, width: 50, height: 25 ],
      [ x: 158, y: 277, width: 50, height: 25 ],
      [ x: 130, y: 404, width: 50, height: 25 ],
      [ x: 285, y: 144, width: 50, height: 25 ],
      [ x: 362, y: 75, width: 50, height: 25 ],
      [ x: 160, y: 38, width: 50, height: 25 ],
      [ x: 43, y: 136, width: 50, height: 25 ],
      [ x: 146, y: 177, width: 50, height: 25 ],
      [ x: 293, y: 87, width: 50, height: 25 ],
      [ x: 130, y: 73, width: 50, height: 25 ],
      [ x: 67, y: 76, width: 50, height: 25 ],
      [ x: 51, y: 149, width: 50, height: 25 ],
      [ x: 66, y: 220, width: 50, height: 25 ],
      [ x: 14, y: 59, width: 50, height: 25 ],
      [ x: 76, y: 28, width: 50, height: 25 ],
      [ x: 145, y: 20, width: 50, height: 25 ],
      [ x: 99, y: 14, width: 50, height: 25 ],
      [ x: 42, y: 26, width: 50, height: 25 ],
      [ x: 37, y: 102, width: 50, height: 25 ],
      [ x: 389, y: 443, width: 50, height: 25 ]
    ] |> Enum.map(fn(params) -> Rectangle.create(params) end)

    comparator = Rectangle.create(x: 110, y: 55, width: 128, height: 128)

    quadtree_result = objects
      |> Enum.reduce(quadtree, fn(obj, tree) -> QuadTree.insert(tree, obj) end)
      |> QuadTree.query(comparator)
      |> Enum.sort(&(&1.y >= &2.y))
      |> Enum.sort(&(&1.x >= &2.x))

    list_result = objects
      |> Enum.filter(fn(rect) -> Rectangle.collides?(rect, comparator) end)
      |> Enum.sort(&(&1.y >= &2.y))
      |> Enum.sort(&(&1.x >= &2.x))

      assert quadtree_result == list_result
  end
end
