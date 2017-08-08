# Quadtreex

An implementation of Quadtrees in Elixir. A quadtree is a data structure that allows for efficient 2D collision detection.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `quadtree` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:quadtree, "~> 0.1.0"}
  ]
end
```

# Quick Documentation

This quadtree implementation assumes rectangular objects, so it is recommended to use the attached Rectangle module for your shapes.

```elixir
# Create objects and a viewport
object1 = Rectangle.create(x: 110, y: 55, width: 2, height: 3)
object2 = Rectangle.create(x: 250, y: 130, width: 10, height: 10)
viewport = Rectangle.create(x: 100, y: 50, width: 64, height: 64)
# Create a 500x500 quadtree and add the object
# Then get a list of items within the viewport
QuadTree.create(width: 500, height: 500)
  |> QuadTree.insert(object1)
  |> QuadTree.insert(object2)
  |> QuadTree.query(viewport)
  |> IO.inspect
```

Outputs:

```elixir
[%Rectangle{height: 3, width: 2, x: 110, y: 55}]
```

As expected, only the first object is within the viewport.
